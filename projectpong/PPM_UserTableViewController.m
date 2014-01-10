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
    
    self.addImageFromCamera.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.addImageFromLibrary.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    self.saveUser.tintColor = [self.gameSettingsAccess.settings getThemeColorLabelForKey:@"Primary"];
    
    //if UserImage is Empty
    //[self.gameSettingsAccess setBackgroundForUIObject:self.userImage withKey:@"User"];
    self.userImage.image = [self.gameSettingsAccess getCurrentUserImage];
    
    self.nameTextField.text = [self.gameSettingsAccess getCurrentUserName];
    [self.nameTextField setDelegate:self];

    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Table view data source

- (IBAction)saveButtonPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Save"
                          message:[NSString stringWithFormat:@"I have saved the current information"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alert show];
    
    [self.gameSettingsAccess saveUserImage:self.userImage];
    
    [self.gameSettingsAccess saveUserName:self.nameTextField];

}


- (IBAction)addImageFromCameraPressed:(id)sender{

if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
{
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType =
    UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker
                       animated:YES completion:nil];
    _newMedia = YES;
}
else{

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Camera"
                          message:[NSString stringWithFormat:@"You don't have a camera on this device"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

    
}

- (IBAction)addImageFromLibraryPressed:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
    
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        _userImage.image = image;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
