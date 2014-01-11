//
//  PPM_SettingsTableViewController.h
//  projectpong
//
//  Created by Federico Freschi on 28/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"



@interface PPM_SettingsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *difficultyLable;
@property (weak, nonatomic) IBOutlet UILabel *themeLable;
@property (weak, nonatomic) IBOutlet UILabel *gameTimerLable;
@property (weak, nonatomic) IBOutlet UILabel *userLable;
@property (weak, nonatomic) IBOutlet UILabel *socialLable;
@property (weak, nonatomic) IBOutlet UILabel *soundLable;

@property (strong, nonatomic) IBOutlet UITableView *settingsTable;
@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;


@end
