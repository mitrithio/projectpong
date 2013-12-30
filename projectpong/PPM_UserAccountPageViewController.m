//
//  PPM_UserAccountPageViewController.m
//  projectpong
//
//  Created by Federico Freschi on 27/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_UserAccountPageViewController.h"

@interface PPM_UserAccountPageViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;


@property UIPopoverController* myPopoverController;

@end

@implementation PPM_UserAccountPageViewController


@synthesize containerView = _containerView;
@synthesize gameSettingsAccess;


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
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.userBackground withKey:@"Background"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
