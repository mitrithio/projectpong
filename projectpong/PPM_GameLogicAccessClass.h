//
//  PPM_LogicAccessClass.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 20/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PPM_GameLogicAccessClass : NSObject

-(void)animateTheBall;

-(id)initWithGameView:(UIView*)view
          orientation:(UIInterfaceOrientation)orientation;

-(void)setGameInPause:(BOOL)pause;

/*!
 this method sets the image of a UIImageView. The image setted is type of <Theme><Key>.png where <Theme> is the chosen theme, while <Key> is the specific name of the image to pick.
 \param the view where set the image
 \param the <Key> of the image
 \see PPM_Settings for theme settings. 
 */


-(void)setBackgroundForView:(UIImageView*)view withKey:(NSString*)key;

-(UIImage*)getThemeImageForKey:(NSString*)key;  



@end
