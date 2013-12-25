//
//  PPM_Settings.h
//  projectpong
//
//  Created by Andrea Cavicchia on 25/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum difficultyEnumerator {
    notSet = 0,
    easy = 1,
    medium = 2,
    hard = 3
} Difficulty;

@interface PPM_Settings : NSObject

/*!
 getter of the difficulty property
 \return the difficulty property as setted in user defaults.
 */
-(Difficulty )difficulty;

/*!
 set the difficulty property as saved in user defaults. If in user defaults difficulty is not setted, the property is authomatically setted as easy.
 */
-(void)setDifficulty;

@end
