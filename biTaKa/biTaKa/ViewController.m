//
//  ViewController.m
//  biTaKa
//
//  Created by Admin on 27/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)login:(id)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self alertMessage:@"Succesfull login."];
                                            // todo clear segue and manual
                                        } else {
                                            // The login failed. Check error to see why.
                                            //NSString *errorString = [error userInfo][@"error"];
                                            [self alertMessage:[NSString stringWithFormat:@"Login failed"]];
                                            // todo return to login
                                        }
                                    }];
    
    [self.username resignFirstResponder];
}

- (IBAction)registerBtn:(id)sender {
    
}

- (IBAction)guestBtn:(id)sender {
    
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

-(void)alertMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

@end