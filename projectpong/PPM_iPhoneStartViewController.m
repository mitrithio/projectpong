//
//  PPM_iPhoneStartViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_iPhoneStartViewController.h"

@interface PPM_iPhoneStartViewController ()

@end

@implementation PPM_iPhoneStartViewController

@synthesize gameLogicAccess;
@synthesize gameSettingsAccess;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    
    self.userLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    NSLog(@"ViewDidLoad loaded");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end