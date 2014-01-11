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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.TimerTable withKey:@"Background"];
    
    self.TimerTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    
    self.activateTimerLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    self.TimerOnOff.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    self.TimerOnOff.onTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.TimerSelector.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];

    
    if ([self.gameSettingsAccess getCurrentTimerOnOff]){
        [self.TimerOnOff setSelected:TRUE];
        switch ([self.gameSettingsAccess getCurrentTimerSelector]){
            case 30:
                [self.TimerSelector setSelectedSegmentIndex:(0)];
                break;
            case 60:
                [self.TimerSelector setSelectedSegmentIndex:(1)];
                break;
                
            case 120:
                [self.TimerSelector setSelectedSegmentIndex:(2)];
                break;
            default:
                NSLog(@"Error in parsing Theme enumeration");
                @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting defoult AIdifficulty" userInfo:nil];
        }
    }
    else
    {
        [self.TimerOnOff setOn:FALSE];
        [self.TimerSelector setEnabled:FALSE];
        switch ([self.gameSettingsAccess getCurrentTimerSelector]){
            case 30:
                [self.TimerSelector setSelectedSegmentIndex:(0)];
                break;
            case 60:
                [self.TimerSelector setSelectedSegmentIndex:(1)];
                break;
                
            case 120:
                [self.TimerSelector setSelectedSegmentIndex:(2)];
                break;
            default:
                NSLog(@"Error in parsing Theme enumeration");
                @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting defoult AIdifficulty" userInfo:nil];
        }
    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (IBAction)TimerOn:(id)sender {
    
    [self.gameSettingsAccess saveTimerOnOff:self.TimerOnOff];

    if (self.TimerSelector.enabled == TRUE){
        self.TimerSelector.enabled = FALSE;}
    else{
        self.TimerSelector.enabled = TRUE;}
}

- (IBAction)timerSelectorChange:(id)sender {
    
    [self.gameSettingsAccess saveTimerSelector:self.TimerSelector];
}

@end
