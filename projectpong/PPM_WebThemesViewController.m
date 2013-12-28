//
//  PPM_WebThemesViewController.m
//  ProjectPong
//
//  Created by Federico Freschi on 21/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_WebThemesViewController.h"

@interface PPM_WebThemesViewController ()

@end

@implementation PPM_WebThemesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *strIndirizzo = @"http://www.federicofreschi.com/Portfolio/pongexam_themepage/";
    NSURL *url = [NSURL URLWithString:strIndirizzo];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [_webView setScalesPageToFit:YES];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
