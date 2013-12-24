//
//  PPM_WebThemesViewController.h
//  ProjectPong
//
//  Created by Federico Freschi on 21/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPM_WebThemesViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *loadUrl;


@end
