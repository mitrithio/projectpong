//
//  PPM_UserTableViewController.h
//  projectpong
//
//  Created by Federico Freschi on 30/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPM_UserTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *userTable;

@property (weak, nonatomic) IBOutlet UITableViewCell *imageCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *buttonCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *button2Cell;


@end
