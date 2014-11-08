//
//  ItemTableViewCell.m
//  biTaKa
//
//  Created by Admin on 03/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ItemTableViewCell.h"

@implementation ItemTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
<<<<<<< HEAD
    
    //self.cellItemDescription.text = [[self.items objectAtIndex:indexPath.row] description];
    self.cellItemImage.image = [UIImage imageNamed:@"interior.jpeg"];
    self.cellItemDescription.text = @"test";
    //self.cellItemPrice.text = @"150";
//    self.cellImage.image = self.content.image;
    // Configure the view for the selected state
=======
  
    self.cellItemPrice.layer.borderWidth = 1;
    self.cellItemPrice.layer.cornerRadius = 5;
    self.cellItemPrice.layer.borderColor = [[UIColor blueColor]CGColor];
>>>>>>> FETCH_HEAD
}

@end