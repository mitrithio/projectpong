//
//  PPM_ThemeSettingsViewController.h
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"
#import "PPM_StartViewController.h"

@interface PPM_ThemeSettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *plasticTheme;
@property (weak, nonatomic) IBOutlet UIButton *classicTheme;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNewTheme;

@property (strong, nonatomic) IBOutlet UITableView *themeTable;

@property (weak, nonatomic) IBOutlet UITableViewCell *plasticCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *classicCell;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;
@property (nonatomic, retain) PPM_StartViewController *startViewController;

- (IBAction)plasticThemeActivator:(id)sender;
- (IBAction)classicThemeActivator:(id)sender;

@end
