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

-(id)initWithGameView:(UIView*)gameView;

-(void)setGameInPause:(BOOL)pause;

-(void)getScoreForUser:(UIImageView*)user andPC:(UIImageView*)pc;

-(void)touchInFieldView: (UIGestureRecognizer*)gestureRecognizer;

-(void)endGamePressed;
@end
