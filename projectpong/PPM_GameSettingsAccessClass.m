//
//  PPM_GameSettingsAccessClass.m
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_GameSettingsAccessClass.h"

@implementation PPM_GameSettingsAccessClass

@synthesize settings = _settings;

- (id)init
{
    self = [super init];
    if (self) {
        self.settings = [[PPM_Settings alloc] init];
    }
    return self;
}

-(void)saveGameDifficulty:(Difficulty)difficultyOutlet theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer
{
    
    //[self.settings saveDifficulty:difficulty theme:theme isTimerSetted:isTimerSetted timer:timer];
}


-(void)saveAIDifficulty:(UISegmentedControl*)aidifficulty
{
    NSString *parserStringForAIDifficulty = [aidifficulty titleForSegmentAtIndex:[aidifficulty selectedSegmentIndex]];
    if ([parserStringForAIDifficulty isEqualToString:[aidifficulty titleForSegmentAtIndex:0]]) {
        parserStringForAIDifficulty = @"easy";
    }
    else if ([parserStringForAIDifficulty isEqualToString:[aidifficulty titleForSegmentAtIndex:1]])
    {
        parserStringForAIDifficulty = @"medium";
    }
    else if ([parserStringForAIDifficulty isEqualToString:[aidifficulty titleForSegmentAtIndex:2]])
    {
        parserStringForAIDifficulty = @"hard";
    }
    else
    {
        NSLog(@"Error in parsing AIDifficulty enumeration");
        @throw [NSException exceptionWithName:@"aidifficultyOutOfRange" reason:@"Error in setting the aidifficulty" userInfo:nil];
    }
    
    [self.settings saveAIDifficulty:parserStringForAIDifficulty];
}

-(void)saveBallSpeed:(UISegmentedControl*)ballSpeed
{
    NSString *parserStringForBallSpeed = [ballSpeed titleForSegmentAtIndex:[ballSpeed selectedSegmentIndex]];
    if ([parserStringForBallSpeed isEqualToString:[ballSpeed titleForSegmentAtIndex:0]]) {
        parserStringForBallSpeed = @"easy";
    }
    else if ([parserStringForBallSpeed isEqualToString:[ballSpeed titleForSegmentAtIndex:1]])
    {
        parserStringForBallSpeed = @"medium";
    }
    else if ([parserStringForBallSpeed isEqualToString:[ballSpeed titleForSegmentAtIndex:2]])
    {
        parserStringForBallSpeed = @"hard";
    }
    else
    {
        NSLog(@"Error in parsing AIDifficulty enumeration");
        @throw [NSException exceptionWithName:@"aidifficultyOutOfRange" reason:@"Error in setting the aidifficulty" userInfo:nil];
    }
    
    [self.settings saveBallSpeed:parserStringForBallSpeed];
}

-(void)saveTimerOnOff:(UISwitch*)timerOnOff
{
    BOOL isTimerOn = FALSE;
    if ([timerOnOff isOn])
    {
        isTimerOn = TRUE;
    }
    [self.settings saveIsTimerSetted:isTimerOn];
}

-(void)saveTimerSelector:(UISegmentedControl*)timerSelector
{
    NSString *parserStringForTimerSelector = [timerSelector titleForSegmentAtIndex:[timerSelector selectedSegmentIndex]];
    int timeSelectorToInt = 0;
    if ([parserStringForTimerSelector isEqualToString:[timerSelector titleForSegmentAtIndex:0]]) {
        timeSelectorToInt = 30;
    }
    else if ([parserStringForTimerSelector isEqualToString:[timerSelector titleForSegmentAtIndex:1]])
    {
        timeSelectorToInt = 60;
    }
    else if ([parserStringForTimerSelector isEqualToString:[timerSelector titleForSegmentAtIndex:2]])
    {
        timeSelectorToInt = 90;
    }
    else
    {
        NSLog(@"Error in parsing the timer");
        @throw [NSException exceptionWithName:@"timerOutOfRange" reason:@"Error in setting the timer" userInfo:nil];
    }
    
    [self.settings saveTimer:timeSelectorToInt];
}

-(void)saveTheme:(UIButton*)currentThemeSetted
{
    [self.settings saveTheme:currentThemeSetted.titleLabel.text];
}

-(void)setBackgroundForUIObject:(id)object withKey:(NSString *)key
{
    if ([object isKindOfClass:[UIButton class]])
    {
        UIButton *btn = object;
        [btn setImage:[self getThemeImageForKey:key] forState:UIControlStateNormal];
    }
    else if ([object isKindOfClass:[UIImageView class]])
    {
        UIImageView *imgView = object;
        [imgView setImage:[self getThemeImageForKey:key]];
    }
    else if ([object isKindOfClass:[UIView class]])
    {
        UIView *view = object;
        [view setBackgroundColor:[UIColor colorWithPatternImage:[self getThemeImageForKey:key]]];
    }
    else if ([object isKindOfClass:[UITableView class]])
    {
        UITableView *tblView = object;
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[self getThemeImageForKey:key]];
        [backgroundView setFrame:tblView.frame];
        [tblView setBackgroundView:backgroundView];
        }
    else
    {
        NSLog(@"UI object not recognized. See references for more details.");
        @throw [NSException exceptionWithName:@"OBJRejected" reason:@"UI object not recognized. See references for more details." userInfo:nil];
    }
}

-(UIImage*)getThemeImageForKey:(NSString*)key
{
    NSString *prova = [NSString stringWithFormat:@"%@%@.png",[self.settings settedThemeToString],key];
    return [UIImage imageNamed:prova];
}

-(Difficulty)getCurrentAIDifficulty
{
    return self.settings.aiDifficulty;
}

-(Difficulty)getCurrentBallSpeed
{
    return self.settings.ballSpeed;
}

-(NSString*)getCurrentTheme
{
    return [self.settings settedThemeToString];
}

-(BOOL)getCurrentTimerOnOff
{
    return [self.settings isTimerSetted];
}

-(int)getCurrentTimerSelector
{
    return [self.settings timer];
}


@end
