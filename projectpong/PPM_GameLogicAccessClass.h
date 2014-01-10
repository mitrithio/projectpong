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

-(id)initWithFieldView:(UIImageView*)field;

-(void)setGameInPause:(BOOL)pause;

-(void)setScoreAway:(UILabel*)away andHome:(UILabel*)home;

@end
