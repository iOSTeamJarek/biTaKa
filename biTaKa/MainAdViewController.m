//
//  MainAdViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainAdViewController.h"
#import <Parse/Parse.h>

@interface MainAdViewController ()

@end

@implementation MainAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toCreateItem"]) {
        if ([segue.destinationViewController isKindOfClass:[CreateAdViewController class]]) {
            CreateAdViewController *destVC = segue.destinationViewController;
            destVC.delegate = self;
        }
    }
}

-(void)alertMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

#pragma mark - CreateAddViewControllerDelegate

-(void)addItem:(Item *)item {
    // update table
    // persist data in Parse
    PFObject *parseObject = [PFObject objectWithClassName:@"Item"];
        parseObject[@"Picture"] = @"";
        parseObject[@"Category"] = item.itemCategory;
        parseObject[@"Description"] = item.itemDescription;
        parseObject[@"Price"] = (__bridge id)(item.price);
    
        [parseObject saveInBackground];
    
    [self alertMessage:@"item added"];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end