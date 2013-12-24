//
//  PPM_Bar.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPM_Bar : NSObject

@property (nonatomic, retain) UIImage * image;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGSize size;

- (id) initWithImage:(UIImage*)image initialPosition:(CGPoint)position speed:(CGFloat)speed size:(CGSize)size;

-(float)center;

@end
