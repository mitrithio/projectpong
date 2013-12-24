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
@property (nonatomic) Difficulty difficulty;
@property (nonatomic, retain) UIView * gameView;
@property (nonatomic, retain) UIImageView * ballView;
@property (nonatomic, retain) UIImageView * enemyBarView;
@property (nonatomic, retain) UIImageView * userBarView;

@property (nonatomic, retain) NSTimer *timerForAnimation;

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
    if (!self)
    {
        self = [super init];
        if (self) {
            self.gameView = view;
            self.logic = [[PPM_MainLogicClass alloc] init];
            
            // View of ball inizialization
            CGSize ballSize = CGSizeMake(20, 20);
            //UIImage *ballImage = [self getImageForKey:@"Ball"];
            UIImage *ballImage = [UIImage imageNamed:@"PlasticBall.png"];
            CGPoint initialTopLeftBall = CGPointMake(self.gameView.center.x - (ballSize.width/2), self.gameView.center.y - (ballSize.height/2));
            self.ballView = [[UIImageView alloc] init];
            [self.ballView setImage:ballImage];
            [self.ballView setAlpha:1.0];
            [self.ballView setFrame:CGRectMake(initialTopLeftBall.x, initialTopLeftBall.y, ballSize.width, ballSize.height)];
            [self.gameView addSubview:self.ballView];
            
            [self.logic setBallImage:ballImage InitialPosition:initialTopLeftBall Size:ballSize];
            
            // View of bars
            CGSize barSize = CGSizeMake(60, 20);
            
            //DEBUG
            //UIImage *barImage = [self getImageForKey:@"Bar"];
            UIImage *barImage = [UIImage imageNamed:@"pongbartest.png"];
            
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
            [self.gameView addSubview:self.userBarView];
            [self.gameView addSubview:self.enemyBarView];
        }
    }
    else
    {
        self.gameView = view;
        self.logic = [[PPM_MainLogicClass alloc] initWithGameField:self.gameView];
        
        // View of ball inizialization
        CGSize ballSize = CGSizeMake(20, 20);
        //UIImage *ballImage = [self getImageForKey:@"Ball"];
        UIImage *ballImage = [UIImage imageNamed:@"PlasticBall.png"];
        CGPoint initialTopLeftBall = CGPointMake(self.gameView.center.x - (ballSize.width/2), self.gameView.center.y - (ballSize.height/2));
        self.ballView = [[UIImageView alloc] init];
        [self.ballView setImage:ballImage];
        [self.ballView setAlpha:1.0];
        [self.ballView setFrame:CGRectMake(initialTopLeftBall.x, initialTopLeftBall.y, ballSize.width, ballSize.height)];
        [self.gameView addSubview:self.ballView];
        
        [self.logic setBallImage:ballImage InitialPosition:initialTopLeftBall Size:ballSize];
        
        // View of bars
        CGSize barSize = CGSizeMake(60, 20);
        
        //DEBUG
        //UIImage *barImage = [self getImageForKey:@"Bar"];
        UIImage *barImage = [UIImage imageNamed:@"pongbartest.png"];
        
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
        else if ([exception.name isEqualToString:@"hitDown"])
        {
            angle = 2*M_PI - angle;
            [self.logic calculateArrivingParallelCoordinatePointForAngle:angle]; //da togliere quando implementiamo il movimento dell'user e il rimbalzo giusto sulla sua barretta
        }
        else if ([exception.name isEqualToString:@"hitUp"])
        {
            angle = 2*M_PI - angle;
        }
        [self.logic calculateDeltasForAngle:angle];
    }
}


bool isArrivedToPoint = true;

-(void)animateEnemyBar
{
    if (firstBall) { //da fare solo se la palla va verso la barra nemica
        [self.logic calculateArrivingParallelCoordinatePointForAngle:angle];
    }
    [self.logic updateEnemyBarPositionForView:self.enemyBarView];
}

-(void)animateAll
{
    if (firstBall)
    {
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
        //[self.ballView setAlpha:1.0];
        self.timerForAnimation = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateAll) userInfo:nil repeats:TRUE];
    }
    else
    {
        //[self.gameView sendSubviewToBack:self.ballView];
        [self.timerForAnimation invalidate];
    }
}

-(UIImage*)getImageForKey:(NSString*)key
{
    return [UIImage imageNamed:[NSString stringWithFormat:@"Plastic%@.png",key]];
}


@end
