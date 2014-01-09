//
//  PPM_SocialScoreViewController.m
//  projectpong
//
//  Created by Federico Freschi on 09/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_SocialScoreViewController.h"

@interface PPM_SocialScoreViewController ()

@end

@implementation PPM_SocialScoreViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.SocialScoreBackground withKey:@"Background"];
    
    self.SocialScoreLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.SocialScoreText.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
