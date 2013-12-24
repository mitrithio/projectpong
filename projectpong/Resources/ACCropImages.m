//
//  ACCropImages.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "ACCropImages.h"

@implementation ACCropImages

+(UIImage*) cropImage:(UIImage*)imageToCrop
              originX:(NSInteger)originX
              originY:(NSInteger)originY
                 dimX:(NSInteger)dimX
                 dimY:(NSInteger)dimY
{
    CGRect croppedRect = CGRectMake(originX, originY, dimX, dimY);
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], croppedRect);
    UIImage* result = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return result;
}

@end
