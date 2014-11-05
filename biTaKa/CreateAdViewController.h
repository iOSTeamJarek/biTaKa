//
//  CreateAdViewController.h
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CreateAdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *category;
@property (weak, nonatomic) IBOutlet UITextView *addDescription;
@property (weak, nonatomic) IBOutlet UIButton *addPicture;
@property (weak, nonatomic) IBOutlet UITextField *price;

@end