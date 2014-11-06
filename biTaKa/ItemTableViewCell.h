//
//  ItemTableViewCell.h
//  biTaKa
//
//  Created by Admin on 03/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellItemImage;
@property (weak, nonatomic) IBOutlet UILabel *cellItemDescription;
@property (weak, nonatomic) IBOutlet UILabel *cellItemPrice;

@end