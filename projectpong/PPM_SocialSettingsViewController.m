//
//  PPM_SocialSettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 02/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_SocialSettingsViewController.h"
#import <Social/Social.h>

@interface PPM_SocialSettingsViewController ()

@end

@implementation PPM_SocialSettingsViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.socialBackground withKey:@"Background"];
    
    self.socialLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoginOnTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        //allert you have already an account
        
            }
    else{
        NSLog(@"you don't have twitter");
    }
}


//the simulator don't work here... if you ar not logged on the social nettwork the simulator don't show any allet... on device should work.
- (IBAction)LoginOnFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {

        //allert you have already an account
        
    }
    else{
        NSLog(@"you don't have facebook");
    }
}
@end
