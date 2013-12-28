//
//  PPM_iPhoneStartViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_iPhoneStartViewController.h"

@interface PPM_iPhoneStartViewController ()

@end

@implementation PPM_iPhoneStartViewController

@synthesize gameLogicAccess;
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
    //self.gameLogicAccess = [[PPM_GameLogicAccessClass alloc] init];
    
    
    //dovrebbe funzionare se impostiamo un thema di default. se vogliamo ci metto poco a fare un terzo tema da usare di default o mettiamo il plastic come default.
    
    
    /******************
    UIImage *titleImageSelected = [self.gameLogicAccess getThemeImageForKey:@"Title"];
   // UIImage *titleImageSelected = [UIImage imageNamed:@"PlasticTitle.png"];
    [self.titleImage setImage:titleImageSelected];
    *******************/
    
    //Corretto uso della classe gameSettingsAccess per impostare lo sfondo di un UIImageView:
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForView:self.titleImage withKey:@"Title"];
    
    
    
    UIImage *playImageSelected = [self.gameLogicAccess getThemeImageForKey:@"PlayButton"];
    //UIImage *playImageSelected = [UIImage imageNamed:@"PlasticPlayButton.png"];
    [self.playButton.imageView setImage:playImageSelected];
    
    UIImage *settingsImageSelected = [self.gameLogicAccess getThemeImageForKey:@"SettingsButton"];
    //UIImage *settingsImageSelected = [UIImage imageNamed:@"PlasticSettingsButton.png"];
    [self.settingsButton.imageView setImage:settingsImageSelected];
    
    UIImage *ruleImageSelected = [self.gameLogicAccess getThemeImageForKey:@"RuleButton"];
    //UIImage *ruleImageSelected = [UIImage imageNamed:@"PlasticRuleButton.png"];
    [self.ruleButton.imageView setImage:ruleImageSelected];
    
    UIImage *scoreImageSelected = [self.gameLogicAccess getThemeImageForKey:@"ScoreButton"];
    //UIImage *scoreImageSelected = [UIImage imageNamed:@"PlasticScoreButton.png"];
    [self.scoreButton.imageView setImage:scoreImageSelected];

    UIImage *backgroundImageSelected = [self.gameLogicAccess getThemeImageForKey:@"Background"];
    [self.scoreButton.imageView setImage:backgroundImageSelected];
    
    NSLog(@"ViewDidLoad loaded");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end