//
//  PPM_Settings.m
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_Settings.h"

#define DIFFICULTY @"difficultySetted"
#define THEME @"themeSetted"
#define ISTIMER @"isTimerSetted"
#define TIMER @"timerSetted"

@interface PPM_Settings ()

@property (nonatomic) Difficulty difficulty;
@property (nonatomic) NSString *theme;
@property (nonatomic) BOOL *isTimerSetted;
@property (nonatomic) NSTimeInterval *timer;
@property (nonatomic) NSUserDefaults *userDefaults;

@end

@implementation PPM_Settings

-(Difficulty )difficulty
{
    return self.difficulty;
}

-(void)setDifficulty
{
    if (self.difficulty)
    {
        NSArray *defaults = [[self.userDefaults objectForKey:DIFFICULTY] mutableCopy];
        if (!defaults)
        {
            self.difficulty = easy;
        }
        else
        {
            NSString *difficultyString = [defaults objectAtIndex:0];
            if ([difficultyString isEqualToString:@"easy"])
            {
                self.difficulty = easy;
            }
            else if ([difficultyString isEqualToString:@"medium"])
            {
                self.difficulty = medium;
            }
            else if ([difficultyString isEqualToString:@"hard"])
            {
                self.difficulty = hard;
            }
            else
            {
                NSLog(@"Error in parsing Difficulty enumeration");
                @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
            }
        }
    }
    else
    {
        NSLog(@"Error in parsing Difficulty enumeration");
        @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
    }
}

-(void)saveDifficulty
{
    
}

@end
