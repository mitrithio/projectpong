//
//  PPM_UserAccountPageViewController.h
//  projectpong
//
//  Created by Federico Freschi on 27/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"


@interface PPM_UserAccountPageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userTitle;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;
@property (weak, nonatomic) IBOutlet UILabel *userEmailLable;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userEmailTextField;

@property (weak, nonatomic) IBOutlet UILabel *userImageLable;

@property (weak, nonatomic) IBOutlet UIButton *AddImageFormCamera;
@property (weak, nonatomic) IBOutlet UIButton *AddImageFormLibrary;

@property (weak, nonatomic) IBOutlet UIImageView *userBackground;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
