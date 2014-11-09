//
//  Item.h
//  biTaKa
//
//  Created by Admin on 05/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "Picture.h"

@interface Item : PFObject<PFSubclassing>

// for testing /musrt be a NSMutableArray
@property (retain) PFFile *itemPicture;
@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *itemCategory;
@property (nonatomic) NSString *itemDescription;
@property (nonatomic) NSNumber *itemPrice;

+(NSString *)parseClassName;
+(void)load;

@end