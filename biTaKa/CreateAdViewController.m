//
//  CreateAdViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateAdViewController.h"

@interface CreateAdViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *category;
@property (weak, nonatomic) IBOutlet UITextView *adDescription;
@property (weak, nonatomic) IBOutlet UITextField *price;

@end

@implementation CreateAdViewController

- (IBAction)postButton:(id)sender {
    // todo
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