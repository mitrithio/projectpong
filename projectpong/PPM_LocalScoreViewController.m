//
//  PPM_LocalScoreViewController.m
//  projectpong
//
//  Created by Federico Freschi on 09/01/14.
//  Copyright (c) 2014 ALF. All rights reserved.
//

#import "PPM_LocalScoreViewController.h"
#import "ACCropImages.h"

@interface PPM_LocalScoreViewController ()

@property (nonatomic) NSArray *scores;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PPM_LocalScoreViewController

@synthesize gameSettingsAccess;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    UIImage *backgrndImage = [self.gameSettingsAccess getThemeImageForKey:@"Background"];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:backgrndImage];
    self.LocalScoreTable.separatorColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Element"];
    
    self.LocalScoreLable.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    self.scores = [[NSArray alloc]init];
    self.scores = [self.gameSettingsAccess getScores];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.scores count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    long int row = indexPath.row;
    NSString *MyIdentifier = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    NSString *score = [self.scores objectAtIndex:[self.scores count] - row - 1];
    UIImage *position = [ACCropImages cropImage:[self.gameSettingsAccess getThemeImageForKey:@"Numbers"] originX:85*(row) originY:0 dimX:85 dimY:57];
    cell.textLabel.text = score;
    cell.imageView.image = position;
    cell.textLabel.textColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [UIView new];
    cell.selectedBackgroundView = [UIView new];
    return cell;
}


@end
