//
//  UIView+FindUIViewController.h
//  projectpong
//
//  Created by Andrea Cavicchia on 11/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FindUIViewController)
- (UIViewController *) firstAvailableUIViewController;
- (id) traverseResponderChainForUIViewController;
@end


