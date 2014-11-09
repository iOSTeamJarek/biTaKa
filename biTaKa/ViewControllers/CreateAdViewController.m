//
//  CreateAdViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateAdViewController.h"
#import "CategoryGroup.h"

@interface CreateAdViewController ()

    @property NSMutableArray *categoryData;

@end

@implementation CreateAdViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.categoryData.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.categoryData[row] objectForKey:@"categoryName"];
}

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
   //item.price = [f numberFromString: self.price.text];
    
    [self.delegate addItem:item];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.categoryData = [NSMutableArray arrayWithObjects:@"Hi", @"Bye", nil];
    
    __weak id weakSelf = self;

    
    PFQuery *query = [PFQuery queryWithClassName: [CategoryGroup parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld scores.", objects.count);
            // Do something with the found objects
            [weakSelf setCategoryData:[NSMutableArray arrayWithArray:objects]];
            NSLog(@"%@", [weakSelf categoryData]);
            [[weakSelf picker] reloadAllComponents];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end