//
//  PPM_CreditsViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_CreditsViewController.h"

@interface PPM_CreditsViewController ()

@end

@implementation PPM_CreditsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.creditTextField.text = @"PROGRAMMING:\n Andrea Cavicchia \n Luca Dal Corso \n Federico Freschi \n \n GAME DESIGN:\n Andrea Cavicchia \n Luca Dal Corso \n Federico Freschi \n \n GRAPHIC DESIGN:\n Federico Freschi \n";
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
