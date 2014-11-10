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

@interface CreateAdViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *categoryPickData;
@property (weak, nonatomic) IBOutlet UITextField *itemPrice;
@property (weak, nonatomic) IBOutlet UITextView *itemDescription;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (strong, nonatomic)UIImage* image;


@property (weak, nonatomic) id<CreateAdViewControllerDelegate> delegate;

@end