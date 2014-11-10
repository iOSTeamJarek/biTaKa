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

@implementation CreateAdViewController{
    UIBarButtonItem *createButton;
    NSMutableString *categoryName;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.categoryData.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.categoryData[row] objectForKey:@"categoryName"];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    categoryName = [self.categoryData[row] objectForKey:@"categoryName"];
}

- (IBAction)postButton:(id)sender {
    Item *item = [Item new];
    //item.filename = ...
//    item.itemCategory = self.addCategory.text;
//    item.itemDescription = self.addDescription.text;
//    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
//    [f setNumberStyle:NSNumberFormatterDecimalStyle];
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
            //NSLog(@"%@", [weakSelf itemCategory]);
            [[weakSelf categoryPickData] reloadAllComponents];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    self.navigationController.title = @"Add new customer";
    createButton = [[UIBarButtonItem alloc] initWithTitle:@"Create"
                                                    style:UIBarButtonItemStylePlain
                                                   target:self
                                                   action:@selector(createNewAd)];
    self.navigationItem.rightBarButtonItem = createButton;

    
}

-(void)createNewAd{
    //if ([self validateInput]) {
        //createButton.enabled = NO;
        Item *newItem = [[Item alloc] initWIthName:self.itemName.text
                                             image: self.image
                                          category: categoryName
                                       description:self.itemDescription.text
                                             price: [NSNumber numberWithFloat:[self.itemPrice.text floatValue]]
                                              user: [PFUser currentUser].username];
    [newItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded) {
            NSLog(@"Item SAVED");
        }
        if (error) {
            NSLog(@"%@", error);
        }
    
    }];
        //[self createContact:customer];
                  //       [newItem saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {}];
//            OSCustomersTableVC *prev = (OSCustomersTableVC*)[self backViewController];
//            [prev loadObjects];
//            [self.navigationController popViewControllerAnimated:YES];
//        }];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end