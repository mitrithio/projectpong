//
//  ACPopupViewManager.h
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACPopupViewManager : NSObject

+ (void)showFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration;
+ (void)hideFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration;

+(bool)isAnimationFinished;

@end
