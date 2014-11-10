//
//  AddPictureViewController.h
//  biTaKa
//
//  Created by IV on 11/9/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPictureViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate >

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
