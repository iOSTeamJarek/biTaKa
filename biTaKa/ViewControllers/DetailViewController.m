//
//  DetailViewController.m
//  biTaKa
//
//  Created by IV on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFFile *thumbnail = self.itemData.itemPicture;
    __weak UIImageView *cellImageView = self.itemImage;
    [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        [self.itemImage.layer addAnimation:[self getImageTransition] forKey:nil];
        cellImageView.image = image;
    }];

    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    NSString *price = [NSString stringWithFormat:@"Price: $%@",
                               [fmt stringFromNumber:[NSNumber numberWithFloat:[self.itemData.itemPrice floatValue]]]];
    
    NSString *description = self.itemData.itemDescription;
    NSString *name = [NSString stringWithFormat:@"Item: %@", self.itemData.itemName];
    NSString *category = [NSString stringWithFormat:@"Category: %@", self.itemData.itemCategory];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateAdded = [NSString stringWithFormat:@"Date Added: %@", [formatter stringFromDate:self.itemData.createdAt]];
    NSString *contact = [NSString stringWithFormat:@"Contact: 0895/112 113"];
    NSString *seller = [NSString stringWithFormat:@"Seller: %@", self.itemData.user];
    
    self.lbItemPrice.text = price;
    self.lbItemDescription.text = description;
    self.lbItemName.text = name;
    self.lbItemCategory.text = category;
    self.lbItemDateAdded.text = dateAdded;
    self.lbItemSeller.text = seller;
    self.lbItemContact.text = contact;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(CATransition*)getImageTransition{
    CATransition *trans = [CATransition animation];
    trans.duration = 1.5f;
    trans.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    trans.type = kCATransitionFade;
    return trans;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
