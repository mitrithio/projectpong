//
//  PPM_LogicAccessClass.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 20/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_GameLogicAccessClass.h"
#import "PPM_MainLogicClass.h"
#import "PPM_GameSettingsAccessClass.h"
#import "ACCropImages.h"


#import <QuartzCore/QuartzCore.h>
#import "UIView+FindUIViewController.h"


@interface PPM_GameLogicAccessClass ()

@property (nonatomic, retain) PPM_MainLogicClass *logic;
@property (nonatomic, retain) UIImageView * fieldPortraitView;
@property (nonatomic, retain) UIImageView * ballView;
@property (nonatomic, retain) UIImageView * enemyBarView;
@property (nonatomic, retain) UIImageView * userBarView;
@property (nonatomic, retain) UIImageView *pcScoreView;
@property (nonatomic, retain) UIImageView *userScoreView;

@property (nonatomic, retain) NSTimer *timerForAnimation;
@property (nonatomic, retain) NSTimer *timerForTimer;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *settingsAccess;
@property (nonatomic) UIDeviceOrientation currentOrientation;
@end


@implementation PPM_GameLogicAccessClass

int pcScore;
int userScore;
int timerScore;
CGFloat locationToGo;

- (id)init
{
    NSLog(@"Don't use init. Use initWithFieldView");
    return self;
}


-(id)initWithGameView:(UIView*)gameView
{
    self = [super init];
    if (self) {
        self.fieldPortraitView = [[UIImageView alloc] init];
        [gameView addSubview:self.fieldPortraitView];
        [gameView sendSubviewToBack:self.fieldPortraitView];
        self.logic = [[PPM_MainLogicClass alloc] initWithGameField:self.fieldPortraitView];
        
        
       // UITapGestureRecognizer *tapOnFieldView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchInFieldView:)];
        
       // [self.fieldPortraitView addGestureRecognizer:tapOnFieldView];
    
        self.settingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
        
        UIImage *numbers = [[UIImage alloc] init];
        numbers = [self.settingsAccess getThemeImageForKey:@"Numbers"];
        self.pcScoreView = [[UIImageView alloc] init];
        self.userScoreView = [[UIImageView alloc] init];
        [self.pcScoreView setImage:[ACCropImages cropImage:numbers originX:(85*9) originY:0 dimX:85 dimY:57]];
        [self.userScoreView setImage:[ACCropImages cropImage:numbers originX:(85*9) originY:0 dimX:85 dimY:57]];
        
        [self.settingsAccess setBackgroundForUIObject:gameView withKey:@"Background"];
        
        self.ballView = [[UIImageView alloc] init];
        self.enemyBarView = [[UIImageView alloc] init];
        self.userBarView = [[UIImageView alloc] init];
        
        self.currentOrientation = [[UIDevice currentDevice] orientation];
        
        switch (self.currentOrientation) {
            case UIDeviceOrientationLandscapeRight:
                
                break;
            case UIDeviceOrientationLandscapeLeft:
                
                break;
            case UIDeviceOrientationPortrait:
                
                break;
            default:
                NSLog(@"Orientation not supported");
                break;
        }
            [self.fieldPortraitView setFrame:CGRectMake(self.fieldPortraitView.superview.bounds.origin.x + 20, self.fieldPortraitView.superview.bounds.origin.y + 20, self.fieldPortraitView.superview.bounds.size.width - 40, self.fieldPortraitView.superview.bounds.size.height - 40)];
            [self.settingsAccess setBackgroundForUIObject:self.fieldPortraitView withKey:@"GameBackground"];
        
            // View of ball inizialization
            CGSize ballSize = CGSizeMake(20, 20);
            CGPoint initialTopLeftBall = CGPointMake((self.fieldPortraitView.bounds.size.width - ballSize.width)/2, (self.fieldPortraitView.bounds.size.height - ballSize.height)/2);
            self.ballView = [[UIImageView alloc] initWithFrame:CGRectMake(initialTopLeftBall.x, initialTopLeftBall.y, ballSize.width, ballSize.height)];
            [self.settingsAccess setBackgroundForUIObject:self.ballView withKey:@"Ball"];
            UIImage *ballImage = self.ballView.image;
            [self.ballView setAlpha:1.0];
            
            [self.logic setBallImage:ballImage InitialPosition:initialTopLeftBall Size:ballSize];
            
            
            
            // View of bars
            CGSize barSize = CGSizeMake(60, 20);
            UIImage *barImage = [self.settingsAccess getThemeImageForKey:@"Bar"];
            
            // Enemy Bar initialization
            CGPoint initialTopLeftEnemyBar = CGPointMake((self.fieldPortraitView.bounds.size.width - barSize.width)/2, self.fieldPortraitView.bounds.origin.y + 20);
            self.enemyBarView = [[UIImageView alloc] init];
            [self.enemyBarView setImage:barImage];
            [self.enemyBarView setAlpha:1.0];
            [self.enemyBarView setFrame:CGRectMake(initialTopLeftEnemyBar.x, initialTopLeftEnemyBar.y, barSize.width, barSize.height)];
            
            [self.logic setEnemyBarImage:barImage InitialPosition:initialTopLeftEnemyBar Size:barSize];
            
            // User Bar initialization
            CGPoint initialTopLeftUserBar = CGPointMake((self.fieldPortraitView.bounds.size.width - barSize.width)/2, self.fieldPortraitView.bounds.size.height - barSize.height - 20);
            self.userBarView = [[UIImageView alloc] init];
            [self.userBarView setImage:barImage];
            [self.userBarView setAlpha:1.0];
            [self.userBarView setFrame:CGRectMake(initialTopLeftUserBar.x, initialTopLeftUserBar.y, barSize.width, barSize.height)];
            
            [self.logic setUserBarImage:barImage InitialPosition:initialTopLeftUserBar Size:barSize];
        
        [self.fieldPortraitView addSubview:self.ballView];
        [self.fieldPortraitView addSubview:self.userBarView];
        [self.fieldPortraitView addSubview:self.enemyBarView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
        
        //locationToGo = initialTopLeftUserBar.x + self.userBarView.center.x;
        locationToGo = -1;
        
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
        [self.logic updateBallPositionForView:self.ballView];
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:@"hitRight"])
        {
            angle = M_PI - angle;
            [self.logic calculateEnemyArrivingPointForAngle:angle];
        }
        else if ([exception.name isEqualToString:@"hitLeft"])
        {
            angle = M_PI - angle;
            [self.logic calculateEnemyArrivingPointForAngle:angle];
        }
        else if ([exception.name isEqualToString:@"hitUser"])
        {
            angle = 2*M_PI - angle;
            [self.logic calculateEnemyArrivingPointForAngle:angle]; //da togliere quando implementiamo il movimento dell'user e il rimbalzo giusto sulla sua barretta
        }
        else if ([exception.name isEqualToString:@"hitEnemy"])
        {
            angle = 2*M_PI - angle;
        }
        else if ([exception.name isEqualToString:@"hitUp"])
        {
            NSLog(@"Punto User");
            [self pointSigned:@"User"];
            //[self setGameInPause:TRUE];
            [self.timerForAnimation invalidate];
            self.timerForTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:NO];
        }
        else if ([exception.name isEqualToString:@"hitDown"])
        {
            NSLog(@"Punto Enemy");
            [self pointSigned:@"Enemy"];
            //[self setGameInPause:TRUE];
            [self.timerForAnimation invalidate];
            self.timerForTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:NO];
        }
        [self.logic calculateDeltasForAngle:angle];
    }
}

-(float)newAngleFromHittedUserBar
{
    float newAngle = 0;
    CGFloat ballX = self.ballView.frame.origin.x;
    CGFloat barX = self.userBarView.frame.origin.x;
    if (ballX < barX || ballX + self.ballView.bounds.size.width > barX + self.userBarView.bounds.size.width)
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
    if (hitPointX <= 0 || hitPointX >= self.enemyBarView.frame.size.width)
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
        NSLog(@"%i",userScore);
        ++userScore;
        UIImage *numbers = [self.settingsAccess getThemeImageForKey:@"Numbers"];
        [self.userScoreView setImage:[ACCropImages cropImage:numbers originX:(85*(userScore - 1)) originY:0 dimX:85 dimY:57]];
    }
    else
    {
        NSLog(@"%i",pcScore);
        ++pcScore;
        UIImage *numbers = [self.settingsAccess getThemeImageForKey:@"Numbers"];
        [self.pcScoreView setImage:[ACCropImages cropImage:numbers originX:(85*(pcScore - 1)) originY:0 dimX:85 dimY:57]];
    }
    
    [self.logic reloadBallInCenter:self.ballView];
}

bool isArrivedToPoint = true;

-(void)animateEnemyBar
{
    if (firstBall) { //da fare solo se la palla va verso la barra nemica se abbiamo tempo
        [self.logic calculateEnemyArrivingPointForAngle:angle];
    }
    [self.logic updateEnemyBarPositionForView:self.enemyBarView];
}

-(void)animateUserBar
{
    if (locationToGo != -1)
        [self.logic updateUserBarPositionForView:self.userBarView toNewPosition:&locationToGo];
}

-(void)animateAll
{
    if (firstBall)
    {
        [self animateTheBall];
        [self animateEnemyBar];
        [self animateUserBar];
        [self calcIfWinner];
        firstBall = false;
    }
    else
    {
        [self animateTheBall];
        [self animateEnemyBar];
        [self animateUserBar];
        [self calcIfWinner];
    }
}

-(void)setGameInPause:(BOOL)pause
{
    if (!pause) {
        self.timerForTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimer) userInfo:nil repeats:NO];
    }
    else
    {
        [self.timerForTimer invalidate];
        [self.timerForAnimation invalidate];
    }
}

-(void)startTimer
{
    [self.timerForAnimation invalidate];
    self.timerForAnimation = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateAll) userInfo:nil repeats:YES];
}

-(void)getScoreForUser:(UIImageView*)user andPC:(UIImageView*)pc
{
    [user setImage:self.userScoreView.image];
    [pc setImage:self.pcScoreView.image];
}

-(void)deviceOrientationDidChange:(NSNotification *)notification
{
    UIDeviceOrientation newOrientation = [[UIDevice currentDevice] orientation];
    if ((self.currentOrientation == UIDeviceOrientationPortrait || self.currentOrientation == UIDeviceOrientationLandscapeRight) && newOrientation == UIDeviceOrientationLandscapeLeft) {
        
        NSString *zRotationKeyPath = @"transform.rotation.z";
        
        CGFloat currentAngle = [[self.fieldPortraitView.layer valueForKeyPath:zRotationKeyPath] floatValue];
        CGFloat angleToAdd   = M_PI;
        [self.fieldPortraitView.layer setValue:@(currentAngle+angleToAdd) forKeyPath:zRotationKeyPath];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:zRotationKeyPath];
        animation.duration = 0.5;
        
        animation.toValue = @(0.0);
        animation.byValue = @(angleToAdd);
        
        [self.fieldPortraitView.layer addAnimation:animation forKey:nil];
        self.currentOrientation = newOrientation;
    }
    
    if (self.currentOrientation == UIDeviceOrientationLandscapeLeft && (newOrientation == UIDeviceOrientationPortrait || newOrientation == UIDeviceOrientationLandscapeRight)) {
        
        NSString *zRotationKeyPath = @"transform.rotation.z";
        
        CGFloat currentAngle = [[self.fieldPortraitView.layer valueForKeyPath:zRotationKeyPath] floatValue];
        CGFloat angleToAdd   = -M_PI;
        [self.fieldPortraitView.layer setValue:@(currentAngle+angleToAdd) forKeyPath:zRotationKeyPath];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:zRotationKeyPath];
        animation.duration = 0.5;
        
        animation.toValue = @(0.0);
        animation.byValue = @(angleToAdd);
        
        [self.fieldPortraitView.layer addAnimation:animation forKey:nil];
        self.currentOrientation = newOrientation;
    }
    
    if (newOrientation != self.currentOrientation && newOrientation != UIDeviceOrientationPortraitUpsideDown) {
        self.currentOrientation = newOrientation;
    }
}

-(void)touchInFieldView: (UIGestureRecognizer*)gestureRecognizer
{
    CGPoint tapLocation = [gestureRecognizer locationInView:self.fieldPortraitView];
    locationToGo = tapLocation.x;
//    if (locationToGo < 0)
//        locationToGo = 0;
//    if (locationToGo > self.fieldPortraitView.bounds.size.width)
//        locationToGo = self.fieldPortraitView.bounds.size.width;
}

-(void)calcIfWinner
{
    if (pcScore == 5) {
        [self.timerForAnimation invalidate];
        UIViewController *fieldVC = self.fieldPortraitView.firstAvailableUIViewController;
        
        UIViewController *vc = [fieldVC.storyboard instantiateViewControllerWithIdentifier:@"EndGameID"];
        [vc setValue:@"pc" forKey:@"winner"];
        [vc setValue:[NSString stringWithFormat:@"%d",pcScore] forKey:@"pcScore"];
        [vc setValue:[NSString stringWithFormat:@"%d",userScore] forKey:@"userScore"];
        [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [fieldVC presentViewController:vc animated:YES completion:nil];
    }
    if (userScore == 5) {
        [self.timerForAnimation invalidate];
        UIViewController *fieldVC = self.fieldPortraitView.firstAvailableUIViewController;
        UIViewController *vc = [fieldVC.storyboard instantiateViewControllerWithIdentifier:@"EndGameID"];
        [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [fieldVC presentViewController:vc animated:YES completion:nil];
    }
}

-(void)resultInUserDefaultsWithWinner:(NSString*)winner
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *oldWinner = [userDefaults objectForKey:@"winner"];
    if (oldWinner)
    {
        [userDefaults removeObjectForKey:@"winner"];
    }
    else
    {
        [userDefaults setObject:winner forKey:@"winner"];
    }
    NSString *oldPCScore = [userDefaults objectForKey:@"pcScore"];
    if (oldPCScore)
    {
        [userDefaults removeObjectForKey:@"pcScore"];
    }
    else
    {
        [userDefaults setObject:[NSString stringWithFormat:@"%d",pcScore] forKey:@"pcScore"];
    }
    NSString *oldUserScore = [userDefaults objectForKey:@"userScore"];
    if (oldUserScore)
    {
        [userDefaults removeObjectForKey:@"userScore"];
    }
    else
    {
        [userDefaults setObject:[NSString stringWithFormat:@"%d",userScore] forKey:@"userScore"];
    }
    NSString *oldTimerScore = [userDefaults objectForKey:@"timerScore"];
    if (oldTimerScore)
    {
        [userDefaults removeObjectForKey:@"timerScore"];
    }
    else
    {
        [userDefaults setObject:[NSString stringWithFormat:@"%d",timerScore] forKey:@"timerScore"];
    }
}

@end
