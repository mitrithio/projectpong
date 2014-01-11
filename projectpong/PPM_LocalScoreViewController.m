//
//  PPM_LocalScoreViewController.m
//  projectpong
//
//  Created by Federico Freschi on 09/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_LocalScoreViewController.h"

@interface PPM_LocalScoreViewController ()

@end

@implementation PPM_LocalScoreViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.LocalScoreBackground withKey:@"Background"];
    
    self.LocalScoreTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.LocalScoreLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
