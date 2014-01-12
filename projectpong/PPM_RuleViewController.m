//
//  PPM_RuleViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_RuleViewController.h"

@interface PPM_RuleViewController ()

@end

@implementation PPM_RuleViewController

@synthesize gameSettingsAccess;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        self.rulesText.text = @"The rules of this game are simple. Use the touch controls or the motion sensor controls to move your pleyer's bar. \n \n Make the ball go past the opponent bar and you have scored a point. If the ball go past your player bar, the opponent scores a point. \n \n Score more points than your opponent and you win the glory and the respect of everyone. Otherwise, if you loose, shame and pity are on you. \n \n The score limit is set to 5, if you reach thant score point faster than the opponent you win. \n \n If you end the game in the middle of the match and you are winning or drowing it, you won the game.  \n \n If you set the timer in the settings menù, the time will determinate the end of the game. \n \n Your player bar it can be moved by the your fingher tap on the screen in the position needed.";
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.ruleBackground withKey:@"Background"];
    
    self.ruleTitle.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.rulesText.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.rulePage.pageIndicatorTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.rulePage.currentPageIndicatorTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
