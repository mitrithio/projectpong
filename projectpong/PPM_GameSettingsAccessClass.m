//
//  PPM_GameSettingsAccessClass.m
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_GameSettingsAccessClass.h"


@interface PPM_GameSettingsAccessClass ()

//@property (nonatomic) PPM_Settings *settings;

@end

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
        timeSelectorToInt = 120;
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

-(NSString*)setUrlForSoundWithKey:(NSString *)key
{
    NSString *path = [NSString stringWithFormat:@"%@%@",[self.settings settedThemeToString],key];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: path ofType: @"mp3"];
    
    return soundFilePath;
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

-(Theme)getCurrentTheme
{
    return [self.settings theme];
}

-(BOOL)getCurrentTimerOnOff
{
    return [self.settings isTimerSetted];
}

-(int)getCurrentTimerSelector
{
    return [self.settings timer];
}

-(void)saveUserImage:(UIImageView*)userImage
{
    [self.settings saveUserImage:userImage.image];
}

-(UIImage*)getCurrentUserImage
{
    UIImage *currentUserImage = [[UIImage alloc] init];
    @try {
        currentUserImage = [self.settings takeSettedUserImage];
    }
    @catch (NSException *exception) {
        if ([exception.name isEqualToString:@"ImageNotFound"]) {
            currentUserImage = [self getThemeImageForKey:@"User"];
        }
        else {
            @throw [NSException exceptionWithName:@"ImageError" reason:@"Error in retrieve Image" userInfo:nil];
        }
    }
    
    return currentUserImage;
}

-(void)saveUserName:(UITextField*)nameTextField
{
    [self.settings saveUserName:nameTextField.text];
}

-(NSString*)getCurrentUserName
{
    return [self.settings takeSettedUserName];
}

-(void)saveBackgoundSoundOnOff:(UISwitch*)BackgroundSoundOnOff;
{
    BOOL isBackgroundSoundOn = FALSE;
    if ([BackgroundSoundOnOff isOn])
    {
        isBackgroundSoundOn = TRUE;
    }
    [self.settings saveIsBackgroundSoundSetted:isBackgroundSoundOn];
}

-(BOOL)getCurrentBackgroundSoundOnOff
{
    return [self.settings isBackgroundSoundOn];
}

-(void)saveGameSoundOnOff:(UISwitch*)GameSoundOnOff;
{
    BOOL isGameSoundOn = FALSE;
    if ([GameSoundOnOff isOn])
    {
        isGameSoundOn = TRUE;
    }
    [self.settings saveIsGameSoundSetted:isGameSoundOn];
}

-(BOOL)getCurrentGameSoundOnOff
{
    return [self.settings isGameSoundOn];
}

-(void)saveFinalScore:(int)finalScore
{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSMutableArray *scores = [[userDef objectForKey:@"bestScores"] mutableCopy];
    
    NSString *finalScoreAsString = [NSString stringWithFormat:@"%d",finalScore];
    
    if (!scores) {
        scores = [[NSMutableArray alloc] initWithObjects:finalScoreAsString, nil];
        [userDef setObject:scores forKey:@"bestScores"];
    }
    else
    {
        [scores addObject:finalScoreAsString];
        [scores sortUsingComparator:^NSComparisonResult(id a, id b)
         {
             //Default compare, to protect against cast
             if (![a isKindOfClass:[NSString class]] || ![b isKindOfClass:[NSString class]]) {
                 return ([a compare:b]);
             }
             else {
                 NSString *aString = (NSString*) a;
                 NSString *bString = (NSString*) b;
                 NSNumber *aInt = [NSNumber numberWithInt:[aString intValue]];
                 NSNumber *bInt = [NSNumber numberWithInt:[bString intValue]];
                 return (NSComparisonResult)[aInt compare:bInt];
             }
         }];
        if ([scores count] > 9) {
            [scores removeObjectAtIndex:0];
        }
        [userDef removeObjectForKey:@"bestScores"];
        [userDef setObject:scores forKey:@"bestScores"];
    }
    
    [userDef synchronize];
}

-(NSArray*)getScores
{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSArray *scores = [userDef objectForKey:@"bestScores"];
    return scores;
}

@end
