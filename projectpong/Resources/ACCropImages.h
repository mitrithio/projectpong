//
//  ACCropImages.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACCropImages : NSObject

+(UIImage*) cropImage:(UIImage*)imageToCrop
              originX:(NSInteger)originX
              originY:(NSInteger)originY
                 dimX:(NSInteger)dimX
                 dimY:(NSInteger)dimY;

@end
