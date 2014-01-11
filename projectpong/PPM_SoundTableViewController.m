//
//  PPM_SoundTableViewController.m
//  projectpong
//
//  Created by Federico Freschi on 11/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_SoundTableViewController.h"


@interface PPM_SoundTableViewController ()

@end

@implementation PPM_SoundTableViewController

@synthesize gameSettingsAccess;
@synthesize startViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    self.startViewController = [[PPM_StartViewController alloc] init];
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.soundTable withKey:@"Background"];
    self.soundTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.backSoundLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.gameSoundLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.backSoundOnOff.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    self.backSoundOnOff.onTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.gameSoundOnOff.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    self.gameSoundOnOff.onTintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    if ([self.gameSettingsAccess getCurrentBackgroundSoundOnOff]){
        [self.backSoundOnOff setOn:TRUE];}
    
    else{
        [self.backSoundOnOff setOn:FALSE];
    }
    
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
        [self.gameSoundOnOff setOn:TRUE];;}
    
    else{
        [self.gameSoundOnOff setOn:FALSE];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)BackSoundOn:(id)sender {
    [self.gameSettingsAccess saveBackgoundSoundOnOff:self.backSoundOnOff];
    [self.startViewController.audioPlayer stop];

    

}
- (IBAction)GameSoundOn:(id)sender {
    [self.gameSettingsAccess saveGameSoundOnOff:self.gameSoundOnOff];
    [self.startViewController.audioPlayer stop];

}

@end
