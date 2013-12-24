//
//  PPM_Ball.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPM_Ball : NSObject

@property (nonatomic, retain) UIImage * image;
@property (nonatomic) CGFloat speed;
@property (nonatomic) CGPoint position;
@property (nonatomic) CGSize size;

- (id) initWithImage:(UIImage*)image initialPosition:(CGPoint)position speed:(CGFloat)speed Size:(CGSize)size;

@end
