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

#define PAUSE_PLAY_IMAGE @"button-play-pause.png"

@interface PPM_GameViewController ()

@property (nonatomic) BOOL isGameInPause;
@property (retain, nonatomic) UIImageView *fieldView;
@property (nonatomic, strong) PPM_GameLogicAccessClass *logicAccess;
@property (nonatomic, strong) PPM_GameSettingsAccessClass *settingsAccess;

@end

@implementation PPM_GameViewController

@synthesize fieldView = _fieldView;
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
    [self.pauseMenuView setAlpha:0.0];
    [ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
    
    // pause/play button
    [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
    [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
    self.isGameInPause = TRUE;
    
    self.fieldView = [[UIImageView alloc] init];
    [self.gameView addSubview:self.fieldView];
    [self.gameView sendSubviewToBack:self.fieldView];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    self.logicAccess = [[PPM_GameLogicAccessClass alloc] initWithFieldView:_fieldView];
    [self.logicAccess setScoreAway:self.awayScore andHome:self.homeScore];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pauseMenuPressed:(id)sender {
    if ([ACPopupViewManager isAnimationFinished])
    {
        if (self.isGameInPause)
        {
            [ACPopupViewManager hideFlipAnimatedPopupView:self.pauseMenuView duration:0.2];
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
            
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
            
            self.isGameInPause = FALSE;
            [self.logicAccess setGameInPause:FALSE];
        }
        else
        {
            // visualize the popup view
            [ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
            
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
            
            [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
            self.isGameInPause = TRUE;
            [self.logicAccess setGameInPause:TRUE];
        }
    }
}

-(void)gameShouldBeInPause:(BOOL)pause
{
    if (pause && !self.isGameInPause) {
        // visualize the popup view
        [ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
        self.isGameInPause = TRUE;
        [self.logicAccess setGameInPause:TRUE];
    }
    if (!pause && self.isGameInPause) {
        [ACPopupViewManager hideFlipAnimatedPopupView:self.pauseMenuView duration:0.2];
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
        
        self.isGameInPause = FALSE;
        [self.logicAccess setGameInPause:FALSE];
    }
}


@end
