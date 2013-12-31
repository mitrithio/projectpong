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

@property (weak, nonatomic) IBOutlet UITableViewCell *difficultyButton;
@property (weak, nonatomic) IBOutlet UITableViewCell *themeButton;


@property (strong, nonatomic) IBOutlet UITableView *settingsTable;
@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;


@end
