//
//  PPM_Settings.h
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum difficultyEnumerator {
    easy = 1,
    medium = 2,
    hard = 3
} Difficulty;

typedef enum themeEnumerator {
    classic = 0,
    plastic = 2
} Theme;

@interface PPM_Settings : NSObject

// SETTING-TIME METHODS

/*!
 set the difficulty property as saved in user defaults. If in user defaults difficulty is not setted, the property is authomatically setted as easy.
 */
-(void)setDifficulty;

/*!
 set the theme property as saved in user defaults. If in user defaults theme is not setted, the property is authomatically setted as classic.
 */
-(void)setTheme;

/*!
 set the isTimerSetted property as saved in user defaults. If in user defaults isTimerSetted is not setted, the property is authomatically setted as false.
 */
-(void)setIsTimerSetted;

/*!
 set the timer property as saved in user defaults. If in user defaults timer is not setted, the property is authomatically setted as 30 seconds.
 */
-(void)setTimer;


// --------------------------------------------------- \\


// SAVING-TIME METHODS

/*!
 this method saves the difficulty in user defaults.
 \param the string that rapresents the difficulty. It must be: easy, hard or medium.
 */
-(void)saveDifficulty:(NSString*)difficulty;

/*!
 this method saves the theme in user defaults.
 \param the string that rapresents the theme. It must be: classic or plastic.
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
 this method saves all the settings at once.
 \param the string that rapresents the difficulty. It must be: easy, hard or medium.
 \param the string that rapresents the theme. It must be: classic or plastic.
 \param the value of isTimerSetted.
 \param the value of timer. Use only 30, 60 or 90.
 */
-(void)saveDifficulty:(NSString*) difficulty theme:(NSString*)theme isTimerSetted:(BOOL)isTimerSetted timer:(int)timer;

@end
