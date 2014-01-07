//
//  PPM_DifficultySettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_DifficultySettingsViewController.h"

@interface PPM_DifficultySettingsViewController ()

@end

@implementation PPM_DifficultySettingsViewController

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
    
    [self.gameSettingsAccess setBackgroundForUIObject:self.DifficultyTable withKey:@"Background"];
    
    self.DifficultyTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
     self.AIDifficultySelector.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.BallSpeedSelector.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    
    switch ([self.gameSettingsAccess getCurrentAIDifficulty]){
        case easy:
            [self.AIDifficultySelector setSelectedSegmentIndex:(0)];
            break;
        case medium:
            [self.AIDifficultySelector setSelectedSegmentIndex:(1)];
            break;
            
        case hard:
            [self.AIDifficultySelector setSelectedSegmentIndex:(2)];
            break;
        default:
            NSLog(@"Error in parsing Theme enumeration");
            @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting defoult AIdifficulty" userInfo:nil];
    }
    
    switch ([self.gameSettingsAccess getCurrentBallSpeed]){
        case easy:
            [self.BallSpeedSelector setSelectedSegmentIndex:(0)];
            break;
        case medium:
            [self.BallSpeedSelector setSelectedSegmentIndex:(1)];
            break;
            
        case hard:
            [self.BallSpeedSelector setSelectedSegmentIndex:(2)];
            break;
        default:
            NSLog(@"Error in parsing Theme enumeration");
            @throw [NSException exceptionWithName:@"themeOutOfRange" reason:@"Error in setting defoult ballspeed" userInfo:nil];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aiDifficultyChange:(id)sender {
    [self.gameSettingsAccess saveAIDifficulty:self.AIDifficultySelector];
    
}

- (IBAction)ballSpeedChange:(id)sender {
    [self.gameSettingsAccess saveBallSpeed:self.BallSpeedSelector];
}

#pragma mark - Table view data source
@end
