//
//  PPM_iPhoneStartViewController.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameLogicAccessClass.h"
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_iPhoneStartViewController : UIViewController <NSObject>{
    PPM_GameLogicAccessClass *gameLogicAccess;
}

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIButton *ruleButton;
@property (weak, nonatomic) IBOutlet UIButton *scoreButton;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIImageView *startBackground;

@property (weak, nonatomic) IBOutlet UILabel *userLable;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (nonatomic, retain) PPM_GameLogicAccessClass *gameLogicAccess; //da cancellare a meno che non servano espliciti riferimenti alla logica
@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
