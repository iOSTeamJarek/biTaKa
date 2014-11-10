//
//  ViewController.m
//  biTaKa
//
//  Created by Admin on 27/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainScreenViewController.h"
#import "Parse/Parse.h"
#import "MainAdViewController.h"
#import "AlertUtility.h"
#import "CoreDataManager.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (IBAction)login:(id)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    if(username == nil || username.length < 3){
        [AlertUtility alertWith:@"Invalid username" message:@"Username must be at least 3 characters" andButton:@"OK"];
    }
    else if(password == nil || password.length < 6){
        [AlertUtility alertWith:@"Invalid password" message:@"Password must be at least 6 characters" andButton:@"OK"];
    }
    else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                [AlertUtility alertWith:@"Error occured!" message:@"Wrong username or password" andButton:@"OK"];
            }
            else if (user) {
                MainAdViewController *mainLoggedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"logedMain"];
                [self.navigationController pushViewController:mainLoggedVC animated:YES];
                
            }
        }];
    }
    
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
    self.navigationItem.hidesBackButton = YES;
    // set buttons
    self.loginBtn.layer.borderWidth = 2;
    self.loginBtn.layer.cornerRadius = 15;
    self.regBtn.layer.borderWidth = 2;
    self.regBtn.layer.cornerRadius = 15;
    self.guestBtn.layer.borderWidth = 2;
    self.guestBtn.layer.cornerRadius = 15;
    
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