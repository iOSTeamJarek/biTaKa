//
//  Item.h
//  biTaKa
//
//  Created by Admin on 05/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *filename;
@property (nonatomic) NSString *itemCategory;
@property (nonatomic) NSString *itemDescription;
@property (nonatomic) NSDecimal *price;

@end