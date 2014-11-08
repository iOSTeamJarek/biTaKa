//
//  RegisterViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "Parse/Parse.h"
#import "AlertUtility.h"
#import "MainScreenViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (IBAction)registerBtn:(id)sender {
    [self registerMethod];
}

- (void)registerMethod {
    NSString *userName = self.username.text;
    NSString *password = self.password.text;
    NSString *confirmPassword = self.confirmPassword.text;
    
    if(userName == nil || userName.length < 3){
        [AlertUtility alertWith:@"Invalid username" message:@"Username must be at least 3 characters" andButton:@"OK"];
    }
    else if(password == nil || password.length < 6){
        [AlertUtility alertWith:@"Invalid password" message:@"Password must be at least 5 characters" andButton:@"OK"];
    }
    else if (password == confirmPassword){
        [AlertUtility alertWith:@"Password incorrect" message:@"Confirm password is not the same" andButton:@"OK"];
    }
    else{
        PFUser *user = [PFUser user];
        user.username = self.username.text;
        user.password = self.password.text;

        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Registration success!");
                MainScreenViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
                [self.navigationController pushViewController:loginVC animated:YES];
            }
            else {
                NSLog(@"There was an error in registration");
            }
        }];
    }
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