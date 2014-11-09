//
//  CreateAdViewController.h
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Item.h"

@protocol CreateAdViewControllerDelegate<NSObject>

- (void)addItem:(Item *)item;

@end

@interface CreateAdViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UITextField *addCategory;
@property (weak, nonatomic) IBOutlet UITextView *addDescription;
@property (weak, nonatomic) IBOutlet UITextField *price;

@property (weak, nonatomic) id<CreateAdViewControllerDelegate> delegate;

@end