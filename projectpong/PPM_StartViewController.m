//
//  PPM_iPhoneStartViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_StartViewController.h"


@interface PPM_StartViewController ()



@end

@implementation PPM_StartViewController

//@synthesize gameLogicAccess;
@synthesize gameSettingsAccess;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        self.audioPlayer = [AVAudioPlayer alloc];
    }
    return self;
}

- (void)viewDidLoad
{
   
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    

    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.titleImage withKey:@"Title"];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.playButton withKey:@"PlayButton"];

    
    [self.gameSettingsAccess setBackgroundForUIObject:self.settingsButton withKey:@"SettingsButton"];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.ruleButton withKey:@"RuleButton"];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.scoreButton withKey:@"ScoreButton"];
     
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.startBackground withKey:@"Background"];

    
    self.userLable.text = [self.gameSettingsAccess getCurrentUserName];
    self.userLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.userImage.image = [self.gameSettingsAccess getCurrentUserImage];
    //[self.gameSettingsAccess setBackgroundForUIObject:self.userImage withKey:@"User"];
    
    //[self.audioPlayer stop];
    
//    if (self.audioPlayer != nil) {
//        self.audioPlayer = nil;
//    }
    
    
    
    if ([self.gameSettingsAccess getCurrentBackgroundSoundOnOff]){
    self.audioPlayer = [self.audioPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"Ball2Sound"]] error:NULL];
    [self.audioPlayer setVolume:0.3];
    [self.audioPlayer setNumberOfLoops:-1];
    [self.audioPlayer play];
    }
    
    NSLog(@"ViewDidLoad loaded");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end