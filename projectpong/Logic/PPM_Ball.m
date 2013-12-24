//
//  PPM_Ball.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_Ball.h"

@implementation PPM_Ball

- (id) initWithImage:(UIImage*)image initialPosition:(CGPoint)position speed:(CGFloat)speed Size:(CGSize)size
{
    self = [super init];
    if (self) {
        self.position = position;
        self.image = image;
        self.speed = speed;
        self.size = size;
    }
    return self;
}

- (id)init
{
    @throw [NSException exceptionWithName:@"CantInitThisClass" reason:@"Wrong initialization of PPM_Ball. Use initWithImage:initialPosition:speed:size method." userInfo:nil];
}

@end
