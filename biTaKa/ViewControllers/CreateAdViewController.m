//
//  CreateAdViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateAdViewController.h"

@interface CreateAdViewController ()

@end

@implementation CreateAdViewController

//- (IBAction)addPicture:(id)sender {
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        picker.delegate = self;
//        [self presentModalViewController:picker animated:YES];
//}

//- (void)imagePickerController:(UIImagePickerController *)picker
//            didFinishPickingImage:(UIImage *)image
//                      editingInfo:(NSDictionary *)editingInfo
//{
//    imageView.image = image;
//    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
//}

- (IBAction)postButton:(id)sender {
    Item *item = [Item new];
    //item.filename = ...
    item.itemCategory = self.addCategory.text;
    item.itemDescription = self.addDescription.text;
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    item.price = [f numberFromString: self.price.text];
    
    [self.delegate addItem:item];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end