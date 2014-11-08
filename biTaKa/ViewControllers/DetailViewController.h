//
//  DetailViewController.h
//  biTaKa
//
//  Created by IV on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) Item *itemData;

@property (weak, nonatomic) IBOutlet UILabel *lbItemPrice;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *lbItemName;
@property (weak, nonatomic) IBOutlet UILabel *lbItemCategory;
@property (weak, nonatomic) IBOutlet UILabel *lbItemDateAdded;
@property (weak, nonatomic) IBOutlet UILabel *lbItemSeller;
@property (weak, nonatomic) IBOutlet UILabel *lbItemContact;
@property (weak, nonatomic) IBOutlet UILabel *lbItemDescription;
@end
