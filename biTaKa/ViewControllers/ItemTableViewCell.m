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
  
    self.cellItemPrice.layer.borderWidth = 1;
    self.cellItemPrice.layer.cornerRadius = 5;
    self.cellItemPrice.layer.borderColor = [[UIColor blueColor]CGColor];
}

@end