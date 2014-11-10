//
//  Item.m
//  biTaKa
//
//  Created by Admin on 05/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Item.h"

@implementation Item{
    
}

@dynamic createdAt;
@dynamic objectId;
@dynamic itemPicture;
@dynamic itemName;
@dynamic itemCategory;
@dynamic itemDescription;
@dynamic itemPrice;
@dynamic user;

+(NSString *)parseClassName{
    return @"Item";
}

+(void)load{
    [self registerSubclass];
}

-(instancetype)initWIthName:(NSString*)name
                      image:(UIImage*)image
                   category:(NSString*)category
                description:(NSString*)description
                      price:(NSNumber*)price
                       user:(NSString*)user{
    if (self = [super init]) {
        self.itemName = name;
        NSString *imageName = [NSString stringWithFormat:@"%@.png", name];
        self.itemPicture = [PFFile fileWithName:imageName data:UIImagePNGRepresentation(image)];
        self.itemCategory = category;
        self.itemDescription = description;
        self.itemPrice = price;
        self.user = user;
        
    }
    
    return  self;
}
@end