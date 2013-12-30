//
//  PPM_Colors.m
//  projectpong
//
//  Created by Andrea Cavicchia on 30/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_Colors.h"

@interface PPM_Colors()


@end

@implementation PPM_Colors

- (id)init
{
    self = [super init];
    if (self) {
        self.PlasticPrimaryColor = [UIColor redColor];
        self.PlasticSecondaryColor = [UIColor blueColor];
        self.PlasticElementColor = [UIColor blackColor];
        self.PlasticBackgroundColor = [UIColor whiteColor];
        self.ClassicPrimaryColor = [UIColor whiteColor];
        self.ClassicSecondaryColor = [UIColor greenColor];
        self.ClassicElementColor = [UIColor grayColor];
        self.ClassicBackgroundColor = [UIColor blackColor];
    }
    return self;
}

@end
