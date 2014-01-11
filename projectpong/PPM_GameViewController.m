//
//  PPM_iPhoneGameViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_GameViewController.h"
#import "ACPopupViewManager.h"
#import "ACCropImages.h"
#import "PPM_GameLogicAccessClass.h"
#import "PPM_GameSettingsAccessClass.h"

#import "CustomIOS7AlertView.h"

#define PAUSE_PLAY_IMAGE @"button-play-pause.png"

@interface PPM_GameViewController ()

@property (nonatomic, strong) PPM_GameLogicAccessClass *logicAccess;
@property (nonatomic, strong) PPM_GameSettingsAccessClass *settingsAccess;

@property (nonatomic) UIDeviceOrientation currentOrientation;


@end

@implementation PPM_GameViewController

@synthesize logicAccess = _logicAccess;
@synthesize settingsAccess = _settingsAccess;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view
    
    [self.pauseButton setImage:nil forState:UIControlStateHighlighted];
    [self.pauseButton setImage:nil forState:UIControlStateNormal];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    self.logicAccess = [[PPM_GameLogicAccessClass alloc] initWithGameView:self.gameView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [self showPauseAlert:PPM_PauseAlertTypeBegin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EndGameID"];
        [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:vc animated:YES completion:nil];
    }
    if (buttonIndex == 0) {
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
    }
}

- (IBAction)pauseMenuPressed:(id)sender {
//    if ([ACPopupViewManager isAnimationFinished])
//    {
//        if (self.isGameInPause)
//        {
//            
//            [ACPopupViewManager hideFlipAnimatedPopupView:self.pauseMenuView duration:0.2];
//            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
//            
//            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
//            
//            self.isGameInPause = FALSE;
//            [self.logicAccess setGameInPause:FALSE];
//        }
//        else
//        {
//            // visualize the popup view
//            [ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
//            
//            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
//            
//            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
//            self.isGameInPause = TRUE;
//            [self.logicAccess setGameInPause:TRUE];
//        }
//    }
    
    [self.logicAccess setGameInPause:YES];
    [self.pauseButton setImage:nil forState:UIControlStateHighlighted];
    [self.pauseButton setImage:nil forState:UIControlStateNormal];
    [self showPauseAlert:PPM_PauseAlertTypePause];
}

-(void)showPauseAlert:(enum pauseAlertType)pauseAlertType
{
    CustomIOS7AlertView *av = [[CustomIOS7AlertView alloc] init];
	
    [av setContainerView:[self createResultView]];
    [av setUseMotionEffects:YES];
    
    if (pauseAlertType == PPM_PauseAlertTypeBegin)
    {
        [av setButtonTitles:[NSMutableArray arrayWithObjects:@"Play", @"End Game", nil]];
    }
    else if (pauseAlertType == PPM_PauseAlertTypePause)
    {
        [av setButtonTitles:[NSMutableArray arrayWithObjects:@"Resume", @"End Game", nil]];
    }
    
    [av setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView, NSInteger buttonIndex) {
        if (buttonIndex == 1) {
            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EndGameID"];
            [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:vc animated:YES completion:nil];
        }
        if (buttonIndex == 0) {
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
            
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
            [self.logicAccess setGameInPause:NO];
        }
    }];
    
    [av show];
}

-(UIView *)createResultView
{
    UIView *view = [[UIView alloc] init];
    [view setFrame:CGRectMake(0, 0, 210, 57)];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:view.frame];
    [self.settingsAccess setBackgroundForUIObject:backgroundView withKey:@"Background"];
    
    UIImageView *userScore = [[UIImageView alloc] initWithFrame:CGRectMake(view.bounds.origin.x, view.bounds.origin.y, 85, 57)];
    
    UIImageView *pcScore = [[UIImageView alloc] initWithFrame:CGRectMake(view.bounds.origin.x + 125, view.bounds.origin.y, 85, 57)];
    
    [self.logicAccess getScoreForUser:userScore andPC:pcScore];
    
    [view addSubview:backgroundView];
    [view addSubview:pcScore];
    [view addSubview:userScore];
    
    [userScore setFrame:CGRectMake(view.bounds.origin.x, view.bounds.origin.y, 80, 57)];
    [pcScore setFrame:CGRectMake(view.bounds.origin.x + 120, view.bounds.origin.y, 80, 57)];
    
    return view;
}

-(void)deviceOrientationDidChange:(NSNotification*)notification
{
    UIDeviceOrientation newOrientation = [[UIDevice currentDevice] orientation];
    CGSize viewSize = self.gameView.bounds.size;
    switch (newOrientation) {
        case UIDeviceOrientationPortrait:
            [self.pauseButton setFrame:CGRectMake(viewSize.width - self.pauseButton.bounds.size.width, 0, self.pauseButton.bounds.size.width, self.pauseButton.bounds.size.height)];
            break;
        case UIDeviceOrientationLandscapeLeft:
            [self.pauseButton setFrame:CGRectMake(viewSize.width - self.pauseButton.bounds.size.width, viewSize.height - self.pauseButton.bounds.size.height, self.pauseButton.bounds.size.width, self.pauseButton.bounds.size.height)];
            break;
        case UIDeviceOrientationLandscapeRight:
            [self.pauseButton setFrame:CGRectMake(0, 0, self.pauseButton.bounds.size.width, self.pauseButton.bounds.size.height)];
            break;
        default:
            break;
    }
    
    if (self.currentOrientation != newOrientation && newOrientation != UIDeviceOrientationPortraitUpsideDown && !((self.currentOrientation == UIDeviceOrientationLandscapeLeft && newOrientation == UIDeviceOrientationLandscapeRight) || (self.currentOrientation == UIDeviceOrientationLandscapeRight && newOrientation == UIDeviceOrientationLandscapeLeft))) {
        
        NSString *zRotationKeyPath = @"transform.rotation.z";
        
        CGFloat currentAngle = [[self.pauseButton.layer valueForKeyPath:zRotationKeyPath] floatValue];
        CGFloat angleToAdd   = M_PI/2; // 90 deg = pi/2
        [self.pauseButton.layer setValue:@(currentAngle+angleToAdd) forKeyPath:zRotationKeyPath];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:zRotationKeyPath];
        animation.duration = 0.02;
        
        animation.toValue = @(0.0);
        animation.byValue = @(angleToAdd);
        
        [self.pauseButton.layer addAnimation:animation forKey:nil];
        
        self.currentOrientation = newOrientation;
    }
}

- (IBAction)tapGestureRecognizer:(UIGestureRecognizer*)gesture {
    
    [self.logicAccess touchInFieldView:gesture];
    
}
@end
