//
//  PPM_LocalScoreViewController.h
//  projectpong
//
//  Created by Federico Freschi on 09/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_LocalScoreViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *LocalScoreLable;
@property (weak, nonatomic) IBOutlet UITableView *LocalScoreTable;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;


@end
