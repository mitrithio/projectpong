//
//  PPM_SocialSettingsViewController.h
//  projectpong
//
//  Created by Federico Freschi on 02/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_SocialSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *socialLable;
@property (weak, nonatomic) IBOutlet UIImageView *socialBackground;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
