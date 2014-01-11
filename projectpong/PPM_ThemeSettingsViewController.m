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
@synthesize startViewController;


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
    self.startViewController = [[PPM_StartViewController alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.themeTable withKey:@"Background"];
    self.themeTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.plasticTheme.titleLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.classicTheme.titleLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.addNewTheme.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.plasticCell.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.classicCell.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];

    
    switch (self.gameSettingsAccess.settings.theme){
        case plastic:
            [self.plasticCell setAccessoryType:(UITableViewCellAccessoryCheckmark)];
            self.plasticTheme.enabled = FALSE;
            self.plasticTheme.titleLabel.textColor = [UIColor grayColor];
            break;
        case classic:
            [self.classicCell setAccessoryType:(UITableViewCellAccessoryCheckmark)];
            self.classicTheme.enabled = FALSE;
            self.classicTheme.titleLabel.textColor = [UIColor grayColor];
            break;
        default:
            NSLog(@"Error in parsing Theme enumeration");
            @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting the theme checkmark" userInfo:nil];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)plasticThemeActivator:(id)sender {
  
    [self.gameSettingsAccess saveTheme:self.plasticTheme];
    
    [self.startViewController.audioPlayer stop];
    
    
}

- (IBAction)classicThemeActivator:(id)sender {

    [self.gameSettingsAccess saveTheme:self.classicTheme];
    
    [self.startViewController.audioPlayer stop];
}

@end
