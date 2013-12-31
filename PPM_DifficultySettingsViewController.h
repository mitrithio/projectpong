//
//  PPM_DifficultySettingsViewController.h
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_DifficultySettingsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *DifficultyTable;

@property (weak, nonatomic) IBOutlet UISegmentedControl *AIDifficultySelector;
@property (weak, nonatomic) IBOutlet UISegmentedControl *BallSpeedSelector;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
