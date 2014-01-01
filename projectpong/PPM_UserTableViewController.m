//
//  PPM_UserTableViewController.m
//  projectpong
//
//  Created by Federico Freschi on 30/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_UserTableViewController.h"

@interface PPM_UserTableViewController ()

@end

@implementation PPM_UserTableViewController

@synthesize gameSettingsAccess;


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

    
     [self.gameSettingsAccess setBackgroundForUIObject:self.userTable withKey:@"Background"];
    
    self.imageCell.backgroundColor = [UIColor clearColor];
    self.button2Cell.backgroundColor = [UIColor clearColor];
    self.buttonCell.backgroundColor = [UIColor clearColor];
    
    self.addImageFromCamera.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.addImageFromLibrary.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.saveUser.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    //if UserImage is Empty
    [self.gameSettingsAccess setBackgroundForUIObject:self.userImage withKey:@"User"];

    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

@end
