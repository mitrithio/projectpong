//
//  PPM_InfoViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_InfoViewController.h"


@interface PPM_InfoViewController ()

@end

@implementation PPM_InfoViewController

@synthesize gameSettingsAccess;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.infoText.text = @"This game is a re-edit of the classic old PONG game made by Atari in the 1972. \n \n We made this game as a uncommercial project for the Mobile Programming exams at the Computer game development Master Degree of the Verona Univesity \n \n The use of software, image, sound and intellectual property protected by copiright are made only for educational use";
	// Do any additional setup after loading the view.
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
        [self.gameSettingsAccess setBackgroundForUIObject:self.infoBackground withKey:@"Background"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
