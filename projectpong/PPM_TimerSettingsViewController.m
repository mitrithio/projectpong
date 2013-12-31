//
//  PPM_TimerSettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_TimerSettingsViewController.h"

@interface PPM_TimerSettingsViewController ()

@end

@implementation PPM_TimerSettingsViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.TimerTable withKey:@"Background"];
    
    self.TimerTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    
    self.activateTimerLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    self.TimerOnOff.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    self.TimerOnOff.onTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.TimerSelector.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (IBAction)TimerOn:(id)sender {
    if (self.TimerSelector.enabled == TRUE){
        self.TimerSelector.enabled = FALSE;}
    else{
        self.TimerSelector.enabled = TRUE;}
}
@end
