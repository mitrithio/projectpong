//
//  PPM_SettingsTableViewController.m
//  projectpong
//
//  Created by Federico Freschi on 28/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_SettingsTableViewController.h"

@interface PPM_SettingsTableViewController ()

@end

@implementation PPM_SettingsTableViewController

@synthesize gameSettingsAccess;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.settingsTable withKey:@"Background"];
    
    self.settingsTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.difficultyLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.themeLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.gameTimerLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.userLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.socialLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end
