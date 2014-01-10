//
//  PPM_SocialScoreViewController.h
//  projectpong
//
//  Created by Federico Freschi on 09/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_SocialScoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *SocialScoreBackground;
@property (weak, nonatomic) IBOutlet UILabel *SocialScoreLable;
@property (weak, nonatomic) IBOutlet UILabel *SocialScoreText;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
