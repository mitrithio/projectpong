//
//  PPM_iPhoneGameViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameLogicAccessClass.h"

typedef enum pauseAlertType {
    PPM_PauseAlertTypeBegin = 0,
    PPM_PauseAlertTypePause = 1
}PPM_PauseAlertType;

@interface PPM_GameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (nonatomic) NSInteger *homeScore;
@property (nonatomic) NSInteger *awayScore;


- (IBAction)pauseMenuPressed:(id)sender;

-(void)setLogicAccess:(PPM_GameLogicAccessClass *)logicAccess;

- (IBAction)tapGestureRecognizer:(UIGestureRecognizer*)gesture;

@end
