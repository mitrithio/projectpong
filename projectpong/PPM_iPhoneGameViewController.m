//
//  PPM_iPhoneGameViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_iPhoneGameViewController.h"
#import "ACPopupViewManager.h"
#import "ACCropImages.h"
#import "PPM_GameLogicAccessClass.h"

#define PAUSE_PLAY_IMAGE @"button-play-pause.png"

@interface PPM_iPhoneGameViewController ()

@property (nonatomic) BOOL isGameInPause;
@property (nonatomic, retain) UIImageView *ballView;
@property (nonatomic, strong) PPM_GameLogicAccessClass *logic;

@end

@implementation PPM_iPhoneGameViewController


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
    
    self.logic = [[PPM_GameLogicAccessClass alloc] initWithGameView:self.fieldView orientation:[[UIDevice currentDevice] orientation]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pauseMenuPressed:(id)sender {
    if (self.isGameInPause) {
        [ACPopupViewManager hideFlipAnimatedPopupView:self.pauseMenuView duration:0.2];
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:40 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
        
        self.isGameInPause = FALSE;
        [self.logic setGameInPause:self.isGameInPause];
    }
    else
    {
        // visualize the popup view
        [ACPopupViewManager showFlipAnimatedPopupView:self.pauseMenuView duration:0.5];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:0 dimX:40 dimY:40] forState:UIControlStateNormal];
        
        [self.pauseButton setImage:[ACCropImages cropImage:[UIImage imageNamed:PAUSE_PLAY_IMAGE] originX:0 originY:80 dimX:40 dimY:40] forState:UIControlStateHighlighted];
        self.isGameInPause = TRUE;
        [self.logic setGameInPause:self.isGameInPause];
    }
}


@end
