//
//  PPM_GameSettingsAccessClass.m
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_GameSettingsAccessClass.h"

@implementation PPM_GameSettingsAccessClass

@synthesize logic = _logic;

-(void)saveGameDifficulty:(Difficulty)difficultyOutlet theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer
{
    //[[self.logic settings] saveDifficulty:difficulty theme:theme isTimerSetted:isTimerSetted timer:timer];
}

@end
