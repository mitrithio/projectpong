//
//  PPM_SoundTableViewController.h
//  projectpong
//
//  Created by Federico Freschi on 11/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"
#import "PPM_StartViewController.h"

@interface PPM_SoundTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *backSoundLable;
@property (weak, nonatomic) IBOutlet UILabel *gameSoundLable;
@property (weak, nonatomic) IBOutlet UISwitch *backSoundOnOff;
@property (weak, nonatomic) IBOutlet UISwitch *gameSoundOnOff;
@property (strong, nonatomic) IBOutlet UITableView *soundTable;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;
@property (nonatomic, retain) PPM_StartViewController *startViewController;
@end
