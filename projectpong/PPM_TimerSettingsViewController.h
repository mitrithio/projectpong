//
//  PPM_TimerSettingsViewController.h
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_TimerSettingsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *TimerTable;

@property (weak, nonatomic) IBOutlet UILabel *activateTimerLabel;

@property (weak, nonatomic) IBOutlet UISwitch *TimerOnOff;

@property (weak, nonatomic) IBOutlet UISegmentedControl *TimerSelector;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
