//
//  PPM_iPhoneStartViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPM_iPhoneStartViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIButton *ruleButton;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;

@property (weak, nonatomic) IBOutlet UIImageView *startBackground;

@end
