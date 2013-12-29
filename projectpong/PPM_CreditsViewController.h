//
//  PPM_CreditsViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_CreditsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *creditsBackground;
@property (weak, nonatomic) IBOutlet UITextView *creditTextField;

@property (weak, nonatomic) IBOutlet UILabel *creditsTitle;
@property (weak, nonatomic) IBOutlet UIPageControl *creditsPage;


@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;



@end
