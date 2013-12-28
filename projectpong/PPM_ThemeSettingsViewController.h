//
//  PPM_ThemeSettingsViewController.h
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPM_ThemeSettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIButton *PlasticTheme;
@property (weak, nonatomic) IBOutlet UIButton *ClassicTheme;
@property (weak, nonatomic) IBOutlet UILabel *currentThemeLabel;


@property (strong, nonatomic) IBOutlet UITableView *ThemeTable;

@end
