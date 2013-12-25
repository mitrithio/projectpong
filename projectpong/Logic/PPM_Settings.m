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

@property (nonatomic, readonly) Difficulty difficulty;
@property (nonatomic, readonly) Theme theme;
@property (nonatomic, readonly) BOOL isTimerSetted;
@property (nonatomic, readonly) int timer;
@property (nonatomic) NSUserDefaults *userDefaults;

@end

@implementation PPM_Settings

@synthesize theme = _theme;
@synthesize difficulty = _difficulty;
@synthesize isTimerSetted = _isTimerSetted;
@synthesize timer = _timer;


- (id)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        [self setDifficulty];
        [self setTheme];
        [self setIsTimerSetted];
        [self setTimer];
    }
    return self;
}

-(void)setDifficulty
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    switch (_difficulty) {
        case easy:
        case medium:
        case hard:
            defaults = [[self.userDefaults objectForKey:DIFFICULTY] mutableCopy];
            if ([defaults count] == 0)
            {
                _difficulty = easy;
            }
            else
            {
                NSString *difficultyString = [defaults objectAtIndex:0];
                if ([difficultyString isEqualToString:@"easy"])
                {
                    _difficulty = easy;
                }
                else if ([difficultyString isEqualToString:@"medium"])
                {
                    _difficulty = medium;
                }
                else if ([difficultyString isEqualToString:@"hard"])
                {
                    _difficulty = hard;
                }
                else
                {
                    NSLog(@"Error in parsing Difficulty enumeration");
                    @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
                }
            }
            break;
            
        default:
            NSLog(@"Error in parsing Difficulty enumeration");
            @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
            break;
    }
}

-(void)saveDifficulty:(NSString*)difficulty
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:DIFFICULTY];
    if ([defaults count] == 0)
    {
        [self.userDefaults setObject:difficulty forKey:DIFFICULTY];
    }
    else
    {
        [self.userDefaults removeObjectForKey:DIFFICULTY];
        [self.userDefaults setObject:difficulty forKey:DIFFICULTY];
    }
    [self.userDefaults synchronize];
    [self setDifficulty];
}

-(void)setTheme
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    switch (_theme) {
        case classic:
        case plastic:
            defaults = [[self.userDefaults objectForKey:THEME] mutableCopy];
            if ([defaults count] == 0)
            {
                _theme = classic;
            }
            else
            {
                NSString *themeString = [defaults objectAtIndex:0];
                if ([themeString isEqualToString:@"classic"])
                {
                    _theme = classic;
                }
                else if ([themeString isEqualToString:@"plastic"])
                {
                    _theme = plastic;
                }
                else
                {
                    NSLog(@"Error in parsing Theme enumeration");
                    @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting the theme" userInfo:nil];
                }
            }
            break;
            
        default:
            NSLog(@"Error in parsing Theme enumeration");
            @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting the theme" userInfo:nil];
            break;
    }
}

-(void)saveTheme:(NSString*)theme
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:THEME];
    if ([theme isEqualToString:@"classic"] || [theme isEqualToString:@"plastic"]) {
        if ([defaults count] == 0)
        {
            [self.userDefaults setObject:theme forKey:THEME];
        }
        else
        {
            [self.userDefaults removeObjectForKey:THEME];
            [self.userDefaults setObject:theme forKey:THEME];
        }
    } else {
        NSLog(@"Error in parsing Theme enumeration");
        @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting the theme" userInfo:nil];
    }
    [self.userDefaults synchronize];
    [self setTheme];
}

-(void)setIsTimerSetted
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    defaults = [[self.userDefaults objectForKey:ISTIMER] mutableCopy];
    if ([defaults count] == 0)
    {
        _isTimerSetted = FALSE;
    }
    else
    {
        NSString *isTimerBool = [defaults objectAtIndex:0];
        if ([isTimerBool isEqualToString:@"true"])
        {
            _isTimerSetted = TRUE;
        }
        else if ([isTimerBool isEqualToString:@"false"])
        {
            _isTimerSetted = FALSE;
        }
        else
        {
            NSLog(@"Error in parsing if timer is setted or not");
            @throw [NSException exceptionWithName:@"DontKnowIfTimerISSetted" reason:@"Error in setting the timer" userInfo:nil];
        }
    }
}

-(void)saveIsTimerSetted:(BOOL)isTimerSetted
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:ISTIMER];
    if ([defaults count] != 0)
    {
        [self.userDefaults removeObjectForKey:ISTIMER];
    }
    if (isTimerSetted) {
        [self.userDefaults setObject:@"true" forKey:ISTIMER];
    } else {
        [self.userDefaults setObject:@"false" forKey:ISTIMER];
    }
    [self.userDefaults synchronize];
    [self setIsTimerSetted];
}

-(void)setTimer
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    defaults = [[self.userDefaults objectForKey:TIMER] mutableCopy];
    if ([defaults count] == 0)
    {
        _timer = 30;
    }
    else
    {
        NSString *timerString = [defaults objectAtIndex:0];
        if ([timerString isEqualToString:@"30"])
        {
            _timer = 30;
        }
        else if ([timerString isEqualToString:@"60"])
        {
            _timer = 60;
        }
        else if ([timerString isEqualToString:@"90"])
        {
            _timer = 90;
        }
        else
        {
            NSLog(@"Error in parsing the timer");
            @throw [NSException exceptionWithName:@"timerOutOfRange" reason:@"Error in setting the timer" userInfo:nil];
        }
    }
}

-(void)saveTimer:(int)timer
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:TIMER];
    if ([defaults count] != 0)
    {
        [self.userDefaults removeObjectForKey:TIMER];
    }
    if (timer == 30)
    {
        [self.userDefaults setObject:@"30" forKey:TIMER];
    }
    else if (timer == 60)
    {
        [self.userDefaults setObject:@"60" forKey:TIMER];
    }
    else if (timer == 90)
    {
        [self.userDefaults setObject:@"60" forKey:TIMER];
    }
    else
    {
        NSLog(@"Error in parsing the timer");
        @throw [NSException exceptionWithName:@"timerOutOfRange" reason:@"Error in setting the timer" userInfo:nil];
    }
    [self.userDefaults synchronize];
    [self setTimer];
}

-(void)saveDifficulty:(NSString*) difficulty theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer
{
    [self saveDifficulty:difficulty];
    [self saveTheme:theme];
    [self saveIsTimerSetted:isTimerSetted];
    [self saveTimer:timer];
}




@end
