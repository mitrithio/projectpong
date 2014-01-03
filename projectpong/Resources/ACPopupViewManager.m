//
//  ACPopupViewManager.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "ACPopupViewManager.h"

@implementation ACPopupViewManager

bool animationIsFinished;

+ (void)showFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration
{
    animationIsFinished = false;
    [UIView transitionWithView:popupView
                      duration:duration
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^(void){
                        [popupView setAlpha:1.0];
                    }
                    completion:^(BOOL completed){
                        animationIsFinished = true;
                    }
     ];
}


+ (void)hideFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration
{
    animationIsFinished = false;
    [UIView transitionWithView:popupView
                      duration:duration
                       options: UIViewAnimationOptionTransitionFlipFromRight
                    animations:^(void){
                        [popupView setAlpha:0.0];
                    }
                    completion:^(BOOL completed){
                        animationIsFinished = true;
                    }
     ];
}

+ (bool)isAnimationFinished
{
    return animationIsFinished;
}

@end
