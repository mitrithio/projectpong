//
//  PPM_MainLogicClass.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 20/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPM_MainLogicClass : NSObject

- (id)initWithGameField:(UIView*)field;

-(void)setBallImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size;

-(void)setEnemyBarImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size;

-(void)setUserBarImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size;

-(CGFloat)getBallSpeed;
-(CGFloat)getBarSpeed;

-(void)calculateDeltasForAngle:(float)angle;
-(void)updateBallPositionForView:(UIImageView*)ballView;
-(void)calculateArrivingParallelCoordinatePointForAngle:(float)angle;

-(void)updateEnemyBarPositionForView:(UIImageView*)enemyBarView;

@end
