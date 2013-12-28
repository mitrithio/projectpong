//
//  PPM_ThemeSettingsViewController.m
//  projectpong
//
//  Created by Federico Freschi on 26/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_ThemeSettingsViewController.h"


@interface PPM_ThemeSettingsViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *plasticTableCell;


@end

@implementation PPM_ThemeSettingsViewController

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

    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PlasticBackground.png"]];
    [tempImageView setFrame:self.ThemeTable.frame];
    
    self.ThemeTable.backgroundView = tempImageView;
    
    //[tempImageView release]; da errore il release

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (IBAction)ClassicTheme:(id)sender {

    self.currentThemeLabel.text = @"Current theme: Classic";
  
}
- (IBAction)PlasticTheme:(id)sender {

    self.currentThemeLabel.text = @"Current theme: Plastic";
    
}


@end