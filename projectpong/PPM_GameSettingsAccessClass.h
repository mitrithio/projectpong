//
//  PPM_GameSettingsAccessClass.h
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPM_MainLogicClass.h"


@interface PPM_GameSettingsAccessClass : NSObject

@property (nonatomic) PPM_Settings *settings;

/*!
 this method sets the image of a UIImageView. The image setted is type of <Theme><Key>.png where <Theme> is the chosen theme as saved in user defaults, while <Key> is the specific name of the image to pick.
 \param the view where set the image
 \param the <Key> of the image
 \see PPM_Settings for theme settings.
 */
-(void)setBackgroundForUIObject:(id)view withKey:(NSString*)key;
-(NSString*)setUrlForSoundWithKey:(NSString *)key;

-(UIImage*)getThemeImageForKey:(NSString*)key;



// ******* RETRIEVING INFORMATION TIME ******
-(Difficulty)getCurrentAIDifficulty;
-(Difficulty)getCurrentBallSpeed;
-(Theme)getCurrentTheme;
-(BOOL)getCurrentTimerOnOff;
-(int)getCurrentTimerSelector;
-(UIImage*)getCurrentUserImage;
-(NSString*)getCurrentUserName;
-(BOOL)getCurrentBackgroundSoundOnOff;
-(BOOL)getCurrentGameSoundOnOff;


// ******* SAVING-TIME METHODS ********
-(void)saveAIDifficulty:(UISegmentedControl*)aidifficulty;
-(void)saveBallSpeed:(UISegmentedControl*)ballSpeed;
-(void)saveTimerOnOff:(UISwitch*)timerOnOff;
-(void)saveTimerSelector:(UISegmentedControl*)timerSelector;
-(void)saveTheme:(UIButton*)currentThemeSetted;
-(void)saveUserImage:(UIImageView*)userImage;
-(void)saveUserName:(UITextField*)nameTextField;
-(void)saveBackgoundSoundOnOff:(UISwitch*)BackgroundSoundOnOff;
-(void)saveGameSoundOnOff:(UISwitch*)GameSoundOnOff;
@end
