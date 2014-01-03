//
//  PPM_finalGameViewController.m
//  projectpong
//
//  Created by Federico Freschi on 03/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_finalGameViewController.h"

#import <Social/Social.h>


@interface PPM_finalGameViewController ()

@end

@implementation PPM_finalGameViewController
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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.FinalBackground withKey:@"Background" ];
    
    self.playAgainButton.titleLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.backToMainMenuButton.titleLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.postResultLable.textColor =[self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//the simulator don't work here it's a know bug... if you arw not logged on the social network the simulator don't show any allert... on device should work.
- (IBAction)postOnTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Twitter text"];
        [tweetSheet addImage:[UIImage imageNamed:@"iTunesProjectPong.png"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else{
         NSLog(@"you don't have twitter");
    }
}

//the simulator don't work here it's a know bug... if you arw not logged on the social network the simulator don't show any allert... on device should work.
- (IBAction)postOnFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Facebook text"];
        [controller addImage:[UIImage imageNamed:@"iTunesProjectPong.png"]];
        [self presentViewController:controller animated:YES completion:Nil];
    }
    else{
        NSLog(@"you don't have facebook");
    }
}
@end
