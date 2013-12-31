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

    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlasticBackground.png"]];
    [tempImageView setFrame:self.settingsTable.frame];
    
    self.settingsTable.backgroundView = tempImageView;
    

    
   // [self.gameSettingsAccess setBackgroundForUIObject:self.settingsTable withKey:@"Background"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end
