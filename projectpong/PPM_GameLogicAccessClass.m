//
//  PPM_LogicAccessClass.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 20/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_GameLogicAccessClass.h"
#import "PPM_MainLogicClass.h"


@interface PPM_GameLogicAccessClass ()

@property (nonatomic, retain) PPM_MainLogicClass *logic;
@property (nonatomic, retain) UIView * gameView;
@property (nonatomic, retain) UIImageView * ballView;
@property (nonatomic, retain) UIImageView * enemyBarView;
@property (nonatomic, retain) UIImageView * userBarView;
@property (nonatomic, retain) UILabel *awayScore;
@property (nonatomic, retain) UILabel *homeScore;

@property (nonatomic, retain) NSTimer *timerForAnimation;
@property (nonatomic, retain) NSTimer *timerFor2Animation;

@end


@implementation PPM_GameLogicAccessClass

- (id)init
{
    NSLog(@"Don't use init. Use initWithGameView");
    return self;
}


-(id)initWithGameView:(UIView*)view
          orientation:(UIInterfaceOrientation)orientation
{
    self = [super init];
    if (self) {
        self.gameView = view;
        self.logic = [[PPM_MainLogicClass alloc] initWithGameField:self.gameView];
        
        // View of ball inizialization
        CGSize ballSize = CGSizeMake(20, 20);
        //UIImage *ballImage = [self getImageForKey:@"Ball"];
        UIImage *ballImage = [self getThemeImageForKey:@"Ball"];
        CGPoint initialTopLeftBall = CGPointMake(self.gameView.center.x - (ballSize.width/2), self.gameView.center.y - (ballSize.height/2));
        self.ballView = [[UIImageView alloc] init];
        //[self.ballView setImage:ballImage];
        [self setBackgroundForView:self.ballView withKey:@"Ball"];
        [self.ballView setAlpha:1.0];
        [self.ballView setFrame:CGRectMake(initialTopLeftBall.x, initialTopLeftBall.y, ballSize.width, ballSize.height)];
        [self.gameView addSubview:self.ballView];
        
        [self.logic setBallImage:ballImage InitialPosition:initialTopLeftBall Size:ballSize];
        
        // View of bars
        CGSize barSize = CGSizeMake(60, 20);
        
        //DEBUG
        UIImage *barImage = [self getThemeImageForKey:@"Bar"];
        //UIImage *barImage = [UIImage imageNamed:@"pongbartest.png"];
        
        // Enemy Bar initialization
        CGPoint initialTopLeftEnemyBar = CGPointMake(self.gameView.center.x - (barSize.width/2), self.gameView.frame.origin.y + 20);
        self.enemyBarView = [[UIImageView alloc] init];
        [self.enemyBarView setImage:barImage];
        [self.enemyBarView setAlpha:1.0];
        [self.enemyBarView setFrame:CGRectMake(initialTopLeftEnemyBar.x, initialTopLeftEnemyBar.y, barSize.width, barSize.height)];
        
        [self.logic setEnemyBarImage:barImage InitialPosition:initialTopLeftEnemyBar Size:barSize];
        
        // User Bar initialization
        CGPoint initialTopLeftUserBar = CGPointMake(self.gameView.center.x - (barSize.width/2), self.gameView.frame.size.height - barSize.height/2 - 20);
        self.userBarView = [[UIImageView alloc] init];
        [self.userBarView setImage:barImage];
        [self.userBarView setAlpha:1.0];
        [self.userBarView setFrame:CGRectMake(initialTopLeftUserBar.x, initialTopLeftUserBar.y, barSize.width, barSize.height)];
        
        [self.logic setUserBarImage:barImage InitialPosition:initialTopLeftUserBar Size:barSize];
        
        [self.gameView addSubview:self.ballView];
        [self.gameView sendSubviewToBack:self.ballView];
        [self.gameView addSubview:self.userBarView];
        [self.gameView addSubview:self.enemyBarView];
        
    }
    else
    {
        @throw [NSException exceptionWithName:@"ErrorInitLogicAccess" reason:@"error in logic access initialization" userInfo:nil];
    }
    return self;
}

bool firstBall = true;
float angle;

-(void)animateTheBall
{
    if (firstBall)
    {
        angle = arc4random() % 360 + 1;
        
        if (angle < 30) {
            angle = 30;
        }
        if (angle > 150 && angle < 180) {
            angle = 150;
        }
        if (angle >= 180 && angle < 210) {
            angle = 210;
        }
        if (angle > 330) {
            angle = 330;
        }
        
        angle = angle * 2 * M_PI / 360;
        
        //angle = M_PI_2;
        [self.logic calculateDeltasForAngle:angle];
    }
    
    
    @try {
//        if (firstBall) {
//            UIImageView *ballViewForInvocation = self.ballView;
//            NSInvocation *invocationTimer = [NSInvocation invocationWithMethodSignature:[NSMethodSignature instanceMethodSignatureForSelector:@selector(updateBallPositionForView:)]];
//            [invocationTimer setTarget:self.logic];
//            [invocationTimer setSelector:@selector(updateBallPositionForView:)];
//            [invocationTimer setArgument:&ballViewForInvocation atIndex:2];
//            self.timerFor2Animation = [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:invocationTimer repeats:FALSE];
//        }
//        else
//        {
//            [self.timerFor2Animation invalidate];
//            [self.logic updateBallPositionForView:self.ballView];
//        }
        
        [self.logic updateBallPositionForView:self.ballView];
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:@"hitRight"])
        {
            angle = M_PI - angle;
            [self.logic calculateArrivingParallelCoordinatePointForAngle:angle];
        }
        else if ([exception.name isEqualToString:@"hitLeft"])
        {
            angle = M_PI - angle;
            [self.logic calculateArrivingParallelCoordinatePointForAngle:angle];
        }
        else if ([exception.name isEqualToString:@"hitUser"])
        {
            angle = [self newAngleFromHittedUserBar];
            [self.logic calculateArrivingParallelCoordinatePointForAngle:angle]; //da togliere quando implementiamo il movimento dell'user e il rimbalzo giusto sulla sua barretta
        }
        else if ([exception.name isEqualToString:@"hitEnemy"])
        {
            angle = [self newAngleFromHittedEnemyBar];
        }
        else if ([exception.name isEqualToString:@"hitUp"])
        {
            NSLog(@"Punto User");
            [self pointSigned:@"User"];
        }
        else if ([exception.name isEqualToString:@"hitDown"])
        {
            NSLog(@"Punto Enemy");
            [self pointSigned:@"Enemy"];
        }
        [self.logic calculateDeltasForAngle:angle];
    }
}

-(float)newAngleFromHittedUserBar
{
    float newAngle = 0;
    CGFloat ballX = self.ballView.frame.origin.x + self.ballView.frame.size.width/2;
    CGFloat barX = self.userBarView.frame.origin.x;
    CGFloat hitPointX = ballX - barX;
    if (hitPointX < 0 || hitPointX > self.userBarView.frame.size.width)
    {
        newAngle = M_PI - angle;
    }
    else
    {
        newAngle = 2*M_PI - angle;
    }
    return newAngle;
}

-(float)newAngleFromHittedEnemyBar
{
    float newAngle = 0;
    CGFloat ballX = self.ballView.frame.origin.x + self.ballView.frame.size.width/2;
    CGFloat barX = self.enemyBarView.frame.origin.x;
    CGFloat hitPointX = ballX - barX;
    if (hitPointX < 0 || hitPointX > self.enemyBarView.frame.size.width)
    {
        newAngle = M_PI - angle;
    }
    else
    {
        newAngle = 2*M_PI - angle;
    }
    return newAngle;
}

-(void)pointSigned:(NSString*)whoSigned
{
    firstBall = TRUE;
    if ([whoSigned isEqualToString:@"User"])
    {
        NSLog(@"%i",[self.homeScore.text intValue]);
        self.homeScore.text = [NSString stringWithFormat:@"%i",[self.homeScore.text intValue] + 1];
    }
    else
    {
        NSLog(@"%i",[self.awayScore.text intValue]);
        self.awayScore.text = [NSString stringWithFormat:@"%i",[self.awayScore.text intValue] + 1];
    }
    
    [self.logic reloadBallInCenter:self.ballView];
}

bool isArrivedToPoint = true;

-(void)animateEnemyBar
{
    if (firstBall) { //da fare solo se la palla va verso la barra nemica se abbiamo tempo
        [self.logic calculateArrivingParallelCoordinatePointForAngle:angle];
    }
    [self.logic updateEnemyBarPositionForView:self.enemyBarView];
}

-(void)animateAll
{
    if (firstBall)
    {
        //self.timerFor2Animation = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTheBall) userInfo:nil repeats:FALSE];
        [self animateTheBall];
        [self animateEnemyBar];
        firstBall = false;
    }
    else
    {
        [self animateTheBall];
        [self animateEnemyBar];
    }
}

-(void)setGameInPause:(BOOL)pause
{
    if (!pause) {
        self.timerForAnimation = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateAll) userInfo:nil repeats:TRUE];
    }
    else
    {
        [self.timerForAnimation invalidate];
    }
}

-(void)setBackgroundForView:(UIImageView*)view withKey:(NSString *)key
{
    [view setImage:[self getThemeImageForKey:key]];
}

-(UIImage*)getThemeImageForKey:(NSString*)key
{
    NSString *prova = [NSString stringWithFormat:@"%@%@.png",[self.logic.settings settedThemeToString],key];
    return [UIImage imageNamed:prova];
}

-(void)setScoreAway:(UILabel*)away andHome:(UILabel*)home
{
    self.awayScore = away;
    self.homeScore = home;
}


@end
