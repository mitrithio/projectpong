//
//  PPM_finalGameViewController.m
//  projectpong
//
//  Created by Federico Freschi on 03/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_finalGameViewController.h"
#import "ACCropImages.h"

#import <Social/Social.h>


@interface PPM_finalGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pcScore;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UILabel *line;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;
@property (weak, nonatomic) IBOutlet UILabel *finalScore;
@property (weak, nonatomic) IBOutlet UILabel *yourScore;

@property (nonatomic) NSTimer *timerForViewingScore;

@end

@implementation PPM_finalGameViewController

bool userIsWinner;
int pcScore;
int userScore;
int timerScore;

int finalScore;


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateScores:) name:@"PPM_WinnerNotification" object:nil];
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
    
    self.line.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.postResultLable.textColor =[self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    
    UIImage *numbers = [self.gameSettingsAccess getThemeImageForKey:@"Numbers"];
    CGRect frameForScore = self.userScore.frame;
    UIImageView *userImageView = [[UIImageView alloc] initWithFrame:frameForScore];
    if (userScore == 0) {
            [userImageView setImage:[ACCropImages cropImage:numbers originX:85*9 originY:0 dimX:85 dimY:57]];
        }
        else{
            [userImageView setImage:[ACCropImages cropImage:numbers originX:85*(userScore-1) originY:0 dimX:85 dimY:57]];
        }
    
    frameForScore = self.pcScore.frame;
    UIImageView *pcImageView = [[UIImageView alloc] initWithFrame:frameForScore];
    if (pcScore == 0) {
            [pcImageView setImage:[ACCropImages cropImage:numbers originX:85*9 originY:0 dimX:85 dimY:57]];
        }
        else{
            [pcImageView setImage:[ACCropImages cropImage:numbers originX:85*(pcScore-1) originY:0 dimX:85 dimY:57]];
        }
    
    if (userIsWinner) {
        [self.gameSettingsAccess setBackgroundForUIObject:self.resultImage withKey:@"Win"];
    }
    else{
        [self.gameSettingsAccess setBackgroundForUIObject:self.resultImage withKey:@"Lost"];
    }
    
    self.finalScore.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    self.yourScore.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    [self.view addSubview:userImageView];
    [self.view addSubview:pcImageView];
    self.pcScore.text = @"";
    self.userScore.text = @"";
    
    //if User Image not Set
    [self.gameSettingsAccess setBackgroundForUIObject:self.userImage withKey:@"User"];

    self.userLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.userLable.text = [self.gameSettingsAccess getCurrentUserName];
    
    self.userImage.image = [self.gameSettingsAccess getCurrentUserImage];

    [self.gameSettingsAccess saveFinalScore:finalScore];
    
    tempScore = 0;
    self.timerForViewingScore = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateFinalScoreOnView) userInfo:nil repeats:TRUE];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ppm_FinalScoreVisualizeNotification" object:nil userInfo:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateScores:(NSNotification*)notification
{
    NSDictionary *notificationDictionary = [notification userInfo];
    pcScore = [[notificationDictionary objectForKey:@"pcScore"] intValue];
    userScore = [[notificationDictionary objectForKey:@"userScore"] intValue];
    timerScore = [[notificationDictionary objectForKey:@"timerScore"] intValue];
    if ([[notification object] isEqualToString:@"pc"])
    {
        userIsWinner = false;
    }
    else if ([[notification object] isEqualToString:@"user"])
    {
        userIsWinner = true;
    }
    [self calcFinalScore];
}

-(void)calcFinalScore
{
    if (userIsWinner) {
        finalScore = userScore*153 - pcScore*78 - timerScore*3;
    }
    else
    {
        finalScore = userScore*153 - pcScore*78 + timerScore*3;
    }
}

int tempScore;
-(void)updateFinalScoreOnView
{
    if (tempScore == finalScore) {
        [self.timerForViewingScore invalidate];
    }
    self.finalScore.text = [NSString stringWithFormat:@"%d",tempScore];
    if (finalScore > 0)
    {
        tempScore += 1;
    }
    else
    {
        tempScore -= 1;
    }
}


//the simulator don't work here it's a know bug... if you arw not logged on the social network the simulator don't show any allert with the settings link... on device should work.
- (IBAction)postOnTwitter:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        NSString * twitterText = [NSString stringWithFormat:@"%@ has %@ %d vs %d on Project Pong scoring %d points!", [self.gameSettingsAccess getCurrentUserName], userIsWinner ? @"won" : @"lost", userScore, pcScore, finalScore];
        [tweetSheet setInitialText:twitterText];
        [tweetSheet addImage:[UIImage imageNamed:@"iTunesProjectPong.png"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Twitter Account"
                              message:[NSString stringWithFormat:@"You don't have an account configured go to settings and do it"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

//the simulator don't work here it's a know bug... if you are not logged on the social network the simulator don't show any allert with the settings link... on device should work.
- (IBAction)postOnFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        NSString * facebookText = [NSString stringWithFormat:@"%@ has %@ %d vs %d on Project Pong scoring %d points!", [self.gameSettingsAccess getCurrentUserName], userIsWinner ? @"won" : @"lost", userScore, pcScore, finalScore];
        [controller setInitialText:facebookText];
        [controller addImage:[UIImage imageNamed:@"iTunesProjectPong.png"]];
        [self presentViewController:controller animated:YES completion:Nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Facebook Account"
                              message:[NSString stringWithFormat:@"You don't have an account configured go to settings and do it"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
