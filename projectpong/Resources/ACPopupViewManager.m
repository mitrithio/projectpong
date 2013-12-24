//
//  ACPopupViewManager.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "ACPopupViewManager.h"

@implementation ACPopupViewManager

+ (void)showFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration
{
    [UIView transitionWithView:popupView
                      duration:duration
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^(void){
                        [popupView setAlpha:1.0];
                    }completion:^(BOOL completed){}];
}


+ (void)hideFlipAnimatedPopupView:(UIView *)popupView duration:(NSTimeInterval)duration
{
    [UIView transitionWithView:popupView
                      duration:duration
                       options: UIViewAnimationOptionTransitionFlipFromRight
                    animations:^(void){
                        [popupView setAlpha:0.0];
                    }completion:^(BOOL completed){}];
}

+ (void)showSlideAnimatedPopupView:(UIView*)popupView
{
    
}

+ (void)hideSlideAnimatedPopupView:(UIView*)popupView
{
    
}

@end
