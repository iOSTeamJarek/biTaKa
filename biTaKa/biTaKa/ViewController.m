//
//  ViewController.m
//  biTaKa
//
//  Created by Admin on 27/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)login:(id)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message: [[NSMutableString alloc]initWithFormat: @"%@ %@",username, password]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
    [self.username resignFirstResponder];
}

- (IBAction)register:(id)sender {
    
}

-(void)touchesBegan:(NSSet *)touches
          withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"biTaKa";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end