//
//  PPM_UserTableViewController.h
//  projectpong
//
//  Created by Federico Freschi on 30/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PPM_GameSettingsAccessClass.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PPM_UserTableViewController : UITableViewController <UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *userTable;

@property (weak, nonatomic) IBOutlet UITableViewCell *imageCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *buttonCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *button2Cell;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (weak, nonatomic) IBOutlet UIButton *addImageFromCamera;
@property (weak, nonatomic) IBOutlet UIButton *addImageFromLibrary;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveUser;

@property (nonatomic, retain) PPM_GameSettingsAccessClass *gameSettingsAccess;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;



- (IBAction)addImageFromCameraPressed:(id)sender;
- (IBAction)addImageFromLibraryPressed:(id)sender;
- (IBAction)saveButtonPressed:(id)sender;

@property BOOL newMedia;



@end
