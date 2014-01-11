//
//  PPM_Settings.h
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 enumeration of possible difficulty
 */
typedef enum difficultyEnumerator {
    difficultyNotSetted = 0,
    easy = 1,
    medium = 2,
    hard = 3
} Difficulty;


/*!
 enumeration of possible themes
 */
typedef enum themeEnumerator {
    themeNotSetted = 0,
    classic = 1,
    plastic = 2
} Theme;

/*!
 this class is made to save and load user settings.
 */
@interface PPM_Settings : NSObject

@property (nonatomic, readonly) Difficulty aiDifficulty;
@property (nonatomic, readonly) Difficulty ballSpeed;
@property (nonatomic, readonly) Theme theme;
@property (nonatomic, readonly) BOOL isTimerSetted;
@property (nonatomic, readonly) int timer;
@property (nonatomic, readonly) BOOL isBackgroundSoundOn;
@property (nonatomic, readonly) BOOL isGameSoundOn;

-(NSString*)settedThemeToString;

// SETTING-TIME METHODS

/*!
 set the aiDifficulty property as saved in user defaults. If in user defaults aiDifficulty is not setted, the property is authomatically setted as easy.
 */
-(void)takeSettedAIDifficulty;

/*!
 set the ballSpeed property as saved in user defaults. If in user defaults ballSpeed is not setted, the property is authomatically setted as easy.
 */
-(void)takeSettedBallSpeed;

/*!
 set the theme property as saved in user defaults. If in user defaults theme is not setted, the property is authomatically setted as classic.
 */
-(void)takeSettedTheme;

/*!
 set the isTimerSetted property as saved in user defaults. If in user defaults isTimerSetted is not setted, the property is authomatically setted as false.
 */
-(void)takeSettedIsTimer;

/*!
 set the timer property as saved in user defaults. If in user defaults timer is not setted, the property is authomatically setted as 30 seconds.
 */
-(void)takeSettedTimer;


/*!
 \return the UIImage of the current user if it is saved in user defaults, else this method throw an exception called "ImageNotFound".
 */
-(UIImage*)takeSettedUserImage;

/*!
 \return the NSString of the current user name if it is saved in user defaults, else this method the string @"User".
 */
-(NSString*)takeSettedUserName;

/*!
 set the isBackgroundSoundOn property as saved in user defaults. If in user defaults isBackgroundSoundOn is not setted, the property is authomatically setted as false.
 */
-(void)takeSettedBackgrounSound;

/*!
 set the isGameSoundOn property as saved in user defaults. If in user defaults isGameSoundOn is not setted, the property is authomatically setted as false.
 */
-(void)takeSettedGameSound;


// --------------------------------------------------- \\


// SAVING-TIME METHODS

/*!
 this method saves the aiDifficulty in user defaults.
 \param the string that rapresents the aiDifficulty. It must be: easy, hard or medium.
 */
-(void)saveAIDifficulty:(NSString*)aiDifficulty;

/*!
 this method saves the ballSpeed in user defaults.
 \param the string that rapresents the ballSpeed. It must be: easy, hard or medium.
 */
-(void)saveBallSpeed:(NSString*)ballSpeed;

/*!
 this method saves the theme in user defaults.
 \param the string that rapresents the theme. It must be: "Classic" or "Plastic".
 */
-(void)saveTheme:(NSString*)theme;

/*!
 this method saves the isTimerSetted property in user defaults.
 \param the value of isTimerSetted.
 */
-(void)saveIsTimerSetted:(BOOL)isTimerSetted;

/*!
 this method saves the timer property in user defaults.
 \param the value of timer. Use only 30, 60 or 90.
 */
-(void)saveTimer:(int)timer;


/*!
 this method saves the image of the current user in user defaults.
 \param the UIImage of the user.
 */
-(void)saveUserImage:(UIImage*)image;

/*!
 this method saves the name of the current user in user defaults.
 \param the NSString of the user name.
 */
-(void)saveUserName:(NSString*)username;

/*!
 this method saves the isBackgoundSoundOn property in user defaults.
 \param the value of isTimerSetted.
 */
-(void)saveIsBackgroundSoundSetted:(BOOL)isBackgroundSoundOn;

/*!
 this method saves the isTimerSetted property in user defaults.
 \param the value of isTimerSetted.
 */
-(void)saveIsGameSoundSetted:(BOOL)isGameSoundOn;

/*! DON'T USE - ONLY FOR TESTS
 this method saves all the settings at once.
 \param the string that rapresents the difficulty. It must be: easy, hard or medium.
 \param the string that rapresents the theme. It must be: "Classic" or "Plastic".
 \param the value of isTimerSetted.
 \param the value of timer. Use only 30, 60 or 90.
 */
//-(void)saveDifficulty:(NSString*)difficulty theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer;

/*!
 use this method if you have to set the color of a label, by theme.
 \param the key: only "Primary", "Secondary", "Element", "Backround" are admitted.
 \return the UIColor of the primary, secondary, element or background color of a label
 */
-(UIColor*)getThemeColorLabelForKey:(NSString*)key;

@end
