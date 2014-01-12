//
//  PPM_AppDelegate.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPM_GameSettingsAccessClass.h"

@interface PPM_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@end
