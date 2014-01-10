//
//  PPM_iPhoneGameViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameLogicAccessClass.h"

@interface PPM_GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *pauseMenuView;
@property (strong, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *homeScore;
@property (weak, nonatomic) IBOutlet UILabel *awayScore;


- (IBAction)pauseMenuPressed:(id)sender;

-(void)setLogicAccess:(PPM_GameLogicAccessClass *)logicAccess;

@end
