//
//  PPM_Bar.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_Bar.h"

@implementation PPM_Bar

- (id) initWithImage:(UIImage*)image initialPosition:(CGPoint)position speed:(CGFloat)speed size:(CGSize)size
{
    self = [super init];
    if (self) {
        self.size = size;
        self.position = position;
        self.image = image;
        self.speed = speed;
    }
    return self;
}

- (id)init
{
    @throw [NSException exceptionWithName:@"CantInitThisClass" reason:@"Wrong initialization of PPM_Bar. Use initWithImage:initialPosition:speed:size method." userInfo:nil];
}

-(float)center
{
    return (self.position.x + self.size.width/2);
}

@end
