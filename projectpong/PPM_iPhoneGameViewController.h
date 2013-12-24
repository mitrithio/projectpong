//
//  PPM_iPhoneGameViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPM_iPhoneGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *pauseMenuView;
@property (strong, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *homeScore;
@property (weak, nonatomic) IBOutlet UILabel *awayScore;
@property (weak, nonatomic) IBOutlet UIImageView *fieldView;

- (IBAction)pauseMenuPressed:(id)sender;

@end
