//
//  AddPictureViewController.m
//  biTaKa
//
//  Created by IV on 11/9/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "AddPictureViewController.h"
#import "CreateAdViewController.h"
#import "AlertUtility.h"

@interface AddPictureViewController ()

@end

@implementation AddPictureViewController{
    UIImage *image;
    BOOL isImagePicked;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doneButton];
    isImagePicked = NO;
    self.imageView.image = [UIImage imageNamed:@"no_image"];
    self.navigationItem.title = @"Image Picker";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    
    [self.navigationItem setBackBarButtonItem:backItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doneButton {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(donePickingImage)];
    
    self.navigationItem.rightBarButtonItem = backButton;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnChoose:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:^{ }];
}

- (IBAction)btnCamera:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:^{ }];
    }
    else{
        [AlertUtility alertWith:@"Error" message:@"Camera is not available" andButton:@"OK"];
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)donePickingImage{
    if (isImagePicked) {
        CreateAdViewController *prev = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 2];
        prev.image = image;
        prev.itemImage.image = image;
        [self.navigationController popToViewController:prev animated:YES];
    }
    else{
        [AlertUtility alertWith:@"Error" message:@"No image is picked!" andButton:@"OK"];
    }
}
- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:^{ }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{ }];
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    isImagePicked = YES;
}

-(UIImage*)imageWithImage:(UIImage*)newImage
             scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [newImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* edited = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return edited;
}
@end
