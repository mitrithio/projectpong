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
        self.rulesText.text = @"pong rules... ";
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForView:self.ruleBackground withKey:@"Background"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
