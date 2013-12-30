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
    
    /******************
    UIImage *titleImageSelected = [self.gameLogicAccess getThemeImageForKey:@"Title"];
   // UIImage *titleImageSelected = [UIImage imageNamed:@"PlasticTitle.png"];
    [self.titleImage setImage:titleImageSelected];
    *******************/
    
    //Corretto uso della classe gameSettingsAccess per impostare lo sfondo di un UIImageView:
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.titleImage withKey:@"Title"];
    
    // Ora funziona coi bottoni anche. Ho corretto accettando il bottone intero e non solo la imageView a lui collegato. Ecco l'esempio.
    [self.gameSettingsAccess setBackgroundForUIObject:self.playButton withKey:@"PlayButton"];
    
    /*
    [self.gameSettingsAccess setBackgroundForUIObject:self.settingsButton.imageView withKey:@"SettingsButton"];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.ruleButton.imageView withKey:@"RuleButton"];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.scoreButton.imageView withKey:@"ScoreButton"];
    */
     
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.startBackground withKey:@"Background"];
    
    
    //NSString *currentTheme = self.gameSettingsAccess.getCurrentTheme;
    
    
    //mi servono queste variabiliColore su una classe separata... la gameSettingsAccess dovrebbe andare bene mi serve nella stessa classe un metodo chiammiamolo "setColor" che prenda una nsstring tipo @Lable e setti il colore in base ai nomi delle variabili qui sotto. ovvero concateni il tema+laKEY+Color....   lo farei io ma non vuoi che scrivo sulle tue classi.
    /*
    UIColor *PlasticPrimaryColor = [UIColor redColor];
    UIColor *PlasticSecondaryColor = [UIColor blueColor];
    UIColor *PlasticElementColor = [UIColor blackColor];
    UIcolor *PlasticBackgroundColor = [UIColor whiteColor];
    
    
    UIColor *ClassicPrimaryColor = [UIColor whiteColor];
    UIColor *ClassicSecondaryColor = [UIColor greenColor];
    UIColor *ClassicElementColor = [UIColor grayColor];
    UIcolor *ClassicBackgroundColor = [UIColor blackColor];
    */
    
    //self.userLable.textColor = self.gameSettingsAccess.setColor:withKey:@"Lable";
    
    //tutto questo per poter settare dinamicamente anche i colori delle scritte in base al theme inoltre così un ipotetico nuovo thema.

    
    NSLog(@"ViewDidLoad loaded");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end