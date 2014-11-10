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

-(instancetype)initWIthName:(NSString*)name
                      image:(UIImage*)image
                    category:(NSString*)category
                   description:(NSString*)description
                       price:(NSNumber*)price
                       user:(NSString*)user;

@property (nonatomic) NSDate *createdAt;
@property (nonatomic) NSString *objectId;
@property (nonatomic) PFFile *itemPicture;
@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *itemCategory;
@property (nonatomic) NSString *itemDescription;
@property (nonatomic) NSNumber *itemPrice;
@property(nonatomic) NSString *user;

+(NSString *)parseClassName;
+(void)load;

@end