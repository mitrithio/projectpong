//
//  PPM_SocialSettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 02/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_SocialSettingsViewController.h"

@interface PPM_SocialSettingsViewController ()

@end

@implementation PPM_SocialSettingsViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.socialBackground withKey:@"Background"];
    
    self.socialLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
