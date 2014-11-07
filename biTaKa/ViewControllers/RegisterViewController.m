//
//  RegisterViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "Parse/Parse.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (IBAction)registerBtn:(id)sender {
    [self registerMethod];
}

- (void)registerMethod {
    PFUser *user = [PFUser user];
    user.username = self.username.text;
    user.password = self.password.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self alertMessage:@"You are registered!!!"];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [self alertMessage:errorString];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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