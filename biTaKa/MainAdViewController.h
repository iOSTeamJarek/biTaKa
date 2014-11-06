//
//  MainAdViewController.h
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CreateAdViewController.h"

@interface MainAdViewController : UIViewController<CreateAdViewControllerDelegate, UITableViewDataSource, UITabBarDelegate>

@property (nonatomic) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;

@end