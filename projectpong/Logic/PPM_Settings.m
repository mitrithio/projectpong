//
//  PPM_Settings.m
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_Settings.h"

#define DIFFICULTY @"difficultySetted"
#define BALLSPEED @"ballSpeedSetted"
#define THEME @"themeSetted"
#define ISTIMER @"isTimerSetted"
#define TIMER @"timerSetted"

@interface PPM_Settings ()


@property (nonatomic) NSUserDefaults *userDefaults;

@end

@implementation PPM_Settings

@synthesize theme = _theme;
@synthesize ballSpeed = _ballSpeed;
@synthesize aiDifficulty = _aiDifficulty;
@synthesize isTimerSetted = _isTimerSetted;
@synthesize timer = _timer;


- (id)init
{
    self = [super init];
    if (self) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        [self setAIDifficulty];
        [self setTheme];
        [self setIsTimerSetted];
        [self setTimer];
    }
    return self;
}

-(void)setAIDifficulty
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    switch (_aiDifficulty) {
        case difficultyNotSetted:
        case easy:
        case medium:
        case hard:
            defaults = [[self.userDefaults objectForKey:DIFFICULTY] mutableCopy];
            if ([defaults count] == 0)
            {
                _aiDifficulty = easy;
            }
            else
            {
                NSString *difficultyString = [defaults objectAtIndex:0];
                if ([difficultyString isEqualToString:@"easy"])
                {
                    _aiDifficulty = easy;
                }
                else if ([difficultyString isEqualToString:@"medium"])
                {
                    _aiDifficulty = medium;
                }
                else if ([difficultyString isEqualToString:@"hard"])
                {
                    _aiDifficulty = hard;
                }
                else
                {
                    NSLog(@"Error in parsing AIDifficulty enumeration");
                    @throw [NSException exceptionWithName:@"aidifficultyOutOfRange" reason:@"Error in setting the aidifficulty" userInfo:nil];
                }
            }
            break;
            
        default:
            NSLog(@"Error in parsing AIDifficulty enumeration");
            @throw [NSException exceptionWithName:@"aidifficultyOutOfRange" reason:@"Error in setting the aidifficulty" userInfo:nil];
            break;
    }
}

-(void)saveAIDifficulty:(NSString*)aiDifficulty
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:DIFFICULTY];
    if ([defaults count] == 0)
    {
        [self.userDefaults setObject:aiDifficulty forKey:DIFFICULTY];
    }
    else
    {
        [self.userDefaults removeObjectForKey:DIFFICULTY];
        [self.userDefaults setObject:aiDifficulty forKey:DIFFICULTY];
    }
    [self.userDefaults synchronize];
    [self setAIDifficulty];
}

-(void)setBallSpeed
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    switch (_ballSpeed) {
        case difficultyNotSetted:
        case easy:
        case medium:
        case hard:
            defaults = [[self.userDefaults objectForKey:BALLSPEED] mutableCopy];
            if ([defaults count] == 0)
            {
                _ballSpeed = easy;
            }
            else
            {
                NSString *difficultyString = [defaults objectAtIndex:0];
                if ([difficultyString isEqualToString:@"easy"])
                {
                    _ballSpeed = easy;
                }
                else if ([difficultyString isEqualToString:@"medium"])
                {
                    _ballSpeed = medium;
                }
                else if ([difficultyString isEqualToString:@"hard"])
                {
                    _ballSpeed = hard;
                }
                else
                {
                    NSLog(@"Error in parsing ballSpeed enumeration");
                    @throw [NSException exceptionWithName:@"ballSpeedOutOfRange" reason:@"Error in setting the ballSpeed" userInfo:nil];
                }
            }
            break;
            
        default:
            NSLog(@"Error in parsing ballSpeed enumeration");
            @throw [NSException exceptionWithName:@"ballSpeedOutOfRange" reason:@"Error in setting the ballSpeed" userInfo:nil];
            break;
    }
}

-(void)saveBallSpeed:(NSString*)ballSpeed
{
    NSMutableArray *defaults = [self.userDefaults objectForKey:BALLSPEED];
    if ([defaults count] == 0)
    {
        [self.userDefaults setObject:ballSpeed forKey:BALLSPEED];
    }
    else
    {
        [self.userDefaults removeObjectForKey:BALLSPEED];
        [self.userDefaults setObject:ballSpeed forKey:BALLSPEED];
    }
    [self.userDefaults synchronize];
    [self setBallSpeed];
}


-(void)setTheme
{
    NSMutableArray *defaults = [[NSMutableArray alloc] init];
    switch (_theme) {
        case themeNotSetted:
        case classic:
        case plastic:
            defaults = [[self.userDefaults objectForKey:THEME] mutableCopy];
            if ([defaults count] == 0)
            {
                _theme = plastic;
            }
            else
            {
                NSString *themeString = [defaults objectAtIndex:0];
                if ([themeString isEqualToString:@"Classic"])
                {
                    _theme = classic;
                }
                else if ([themeString isEqualToString:@"Plastic"])
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
    if ([theme isEqualToString:@"Classic"] || [theme isEqualToString:@"Plastic"]) {
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

-(void)saveDifficulty:(NSString*)difficulty theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer
{
    [self saveAIDifficulty:difficulty];
    [self saveTheme:theme];
    [self saveIsTimerSetted:isTimerSetted];
    [self saveTimer:timer];
}

-(NSString*)settedThemeToString
{
    switch (_theme) {
        case classic:
            return @"Classic";
        case plastic:
            return @"Plastic";
        default:
            NSLog(@"Error in parsing Theme enumeration");
            @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting the theme" userInfo:nil];
    }
}

@end
