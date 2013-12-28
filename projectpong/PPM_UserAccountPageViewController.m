//
//  PPM_UserAccountPageViewController.m
//  projectpong
//
//  Created by Federico Freschi on 27/12/13.
//  Copyright (c) 2013 ALF. All rights reserved.
//

#import "PPM_UserAccountPageViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PPM_UserAccountPageViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;


@property UIPopoverController* myPopoverController;

@end

@implementation PPM_UserAccountPageViewController

@synthesize containerView = _containerView;

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IMAGE_PICKER
- (IBAction)addImageFormCamera:(UIButton *)sender {

    //THAT'S FOR THE CAMERA
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        if ([mediaTypes containsObject:(NSString*)kUTTypeImage])
        {
            //UIImagePickerController is a UI NAVIGATION CONTROLLER - Need to Implement both delegates
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
            picker.allowsEditing = YES;
            
            //[self presentModalViewController:picker animated:YES];
            [self presentViewController:picker animated:YES completion:^{}];
        }
        else{
            //NOT SUPPORTING IMAGES IN CAMERA
        }
        
    }
    else{
        //NOT SUPPORTING CAMERA
        NSLog(@"NOT SUPPORTING CAMERA!");
    }
    
}
- (IBAction)addimage:(UIBarButtonItem *)sender {
    
    // valid for UIImagePickerControllerSourceTypePhotoLibrary
    //check if supported type is available
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        NSArray* mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        if ([mediaTypes containsObject:(NSString*)kUTTypeImage])
        {
            //UIImagePickerController derives from NavigationController
            
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
            picker.allowsEditing = TRUE;
            
            //insert picker view contoller in view
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                //insert picker view contoller WITH POPOVER
                
                UIPopoverController* popoverController = [[UIPopoverController alloc] initWithContentViewController:picker];
                
                [popoverController presentPopoverFromRect:CGRectMake(0, 0, self.containerView.frame.size.width, 5)
                                                   inView:self.containerView
                                 permittedArrowDirections:UIPopoverArrowDirectionUp
                                                 animated:YES];
                
                /*[popoverController presentPopoverFromBarButtonItem:sender
                 permittedArrowDirections:UIPopoverArrowDirectionAny
                 animated:YES];*/
                
                
                
                self.myPopoverController = popoverController;
                
                
            }
            else{
                
                //TODO: insert picker view contoller AS MODAL VIEW CONTROLLER
                [self presentViewController:picker animated:YES completion:^{}];
            }
            
            
        }
        else {
            
            // not supporting images in photo library
            
        }
        
        
        
    }
    else {
        
        // not supporting photo library
        
    }
}


-(void)dismissImagePicker{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [self.myPopoverController dismissPopoverAnimated:YES];
    }
    else
    {
        //dismiss modal
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    
}



-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    /*UIImage * selectedImage = [info objectForKey:UIImagePickerControllerEditedImage];
     
     if (!selectedImage)
     selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
     
     UIImageView* imageView = [[UIImageView alloc] initWithImage:selectedImage];
     
     [self setRandomLocationForView:imageView];
     [self.containerView addSubview:imageView];*/
    
    
    
    UIImage * originaleImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (originaleImage)
    {
        for (int i = 0; i < 4; i ++)
        {
            UIImage* croppedImage = [self cropImage:originaleImage];
            
            UIImageView* imageViewCropped = [[UIImageView alloc] initWithImage:croppedImage];
            
         //   [self setRandomLocationForView:imageViewCropped];
            [self.containerView addSubview:imageViewCropped];
            
        }
    }
    
    [self dismissImagePicker];
    
}


-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    
    [self dismissImagePicker];
}


#define IMAGE_DIM 80

-(UIImage*) cropImage:(UIImage*)imageToCrop {
    
    CGFloat x = arc4random()%((int)imageToCrop.size.width - IMAGE_DIM);
    CGFloat y = arc4random()%((int)imageToCrop.size.height - IMAGE_DIM);
    
    CGRect croppedRect = CGRectMake(x, y, IMAGE_DIM, IMAGE_DIM);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], croppedRect);
    
    UIImage* result = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    return result;
    
}
@end
