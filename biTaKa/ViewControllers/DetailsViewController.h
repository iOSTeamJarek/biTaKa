//
//  DetailsViewController.h
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *picsCollection;

@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *dateCreated;
@property (weak, nonatomic) IBOutlet UILabel *itemSeller;
@property (weak, nonatomic) IBOutlet UILabel *itemCategory;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

@end
