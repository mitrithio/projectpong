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

@property (nonatomic) BOOL isGameInPause;
@property (nonatomic, strong) PPM_GameLogicAccessClass *logicAccess;
@property (nonatomic, strong) PPM_GameSettingsAccessClass *settingsAccess;


@end

@implementation PPM_GameViewController

@synthesize logicAccess = _logicAccess;
@synthesize settingsAccess = _settingsAccess;
@synthesize isGameInPause = _isGameInPause;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    // pauseMenuView initialization
    //[self.pauseMenuView setAlpha:0.0];
    //[ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
    
    
    
    [self.pauseButton setImage:nil forState:UIControlStateHighlighted];
    [self.pauseButton setImage:nil forState:UIControlStateNormal];
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:@"PAUSE"
//                          message:[NSString stringWithFormat:@"You don't have an account configured go to settings and do it"] delegate:self cancelButtonTitle:@"Resume" otherButtonTitles:@"End Game", nil];
    
    [self showPauseAlert:PPM_PauseAlertTypeBegin];
    
//    TSAlertView *alert = [[TSAlertView alloc]
//                          initWithTitle:@"PAUSE"
//                          message:[NSString stringWithFormat:@"You don't have an account configured go to settings and do it"] delegate:self cancelButtonTitle:@"Resume" otherButtonTitles:@"End Game", nil];
//    [alert setStyle:TSAlertViewStyleNormal];
//    [alert setFrame:CGRectMake(self.gameView.bounds.size.width/2 - 60, self.gameView.bounds.size.height/2 - 40, 120, 80)];
//    [alert show];
    
    self.isGameInPause = TRUE;
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    self.logicAccess = [[PPM_GameLogicAccessClass alloc] initWithGameView:self.gameView];
    //[self.logicAccess setScoreAway:self.awayScore andHome:self.homeScore];
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
    [view setFrame:CGRectMake(0, 0, 200, 57)];
    
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:view.frame];
    [self.settingsAccess setBackgroundForUIObject:backgroundView withKey:@"Background"];
    
    UIImageView *userScore = [[UIImageView alloc] initWithImage:[ACCropImages cropImage:[UIImage imageNamed:@"PlasticNumbers.png"] originX:850-85 originY:0 dimX:80 dimY:57]];
    
    UIImageView *pcScore = [[UIImageView alloc] initWithImage:[ACCropImages cropImage:[UIImage imageNamed:@"PlasticNumbers.png"] originX:850-85 originY:0 dimX:80 dimY:57]];
    
    [view addSubview:backgroundView];
    [view addSubview:pcScore];
    [view addSubview:userScore];
    
    [userScore setFrame:CGRectMake(view.bounds.origin.x, view.bounds.origin.y, 80, 57)];
    [pcScore setFrame:CGRectMake(view.bounds.origin.x + 120, view.bounds.origin.y, 80, 57)];
    
    return view;
}

@end
