//
//  PPM_finalGameViewController.h
//  projectpong
//
//  Created by Federico Freschi on 03/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_finalGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *FinalBackground;

@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;

@property (weak, nonatomic) IBOutlet UIButton *backToMainMenuButton;

@property (weak, nonatomic) IBOutlet UILabel *postResultLable;

- (IBAction)postOnTwitter:(id)sender;

- (IBAction)postOnFacebook:(id)sender;


@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
