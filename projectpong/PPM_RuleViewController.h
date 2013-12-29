//
//  PPM_RuleViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_RuleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *ruleTitle;
@property (weak, nonatomic) IBOutlet UIImageView *ruleBackground;
@property (weak, nonatomic) IBOutlet UITextView *rulesText;
@property (weak, nonatomic) IBOutlet UIPageControl *rulePage;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
