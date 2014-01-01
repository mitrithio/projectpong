//
//  PPM_ThemeSettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_ThemeSettingsViewController.h"


@interface PPM_ThemeSettingsViewController ()


@end

@implementation PPM_ThemeSettingsViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.themeTable withKey:@"Background"];
    
    self.plasticTheme.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.classicTheme.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.addNewTheme.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.plasticCell.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
      self.classicCell.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)plasticThemeActivator:(id)sender {
    
    [self.plasticCell setAccessoryType:(UITableViewCellAccessoryCheckmark)];
    [self.classicCell setAccessoryType:(UITableViewCellAccessoryNone)];
    
    [self.gameSettingsAccess saveTheme:self.plasticTheme];
}

- (IBAction)classicThemeActivator:(id)sender {
    [self.classicCell setAccessoryType:(UITableViewCellAccessoryCheckmark)];
    [self.plasticCell setAccessoryType:(UITableViewCellAccessoryNone)];
    
    [self.gameSettingsAccess saveTheme:self.classicTheme];
    
}

@end
