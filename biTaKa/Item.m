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

@dynamic imageOfItem;
@dynamic itemCategory;
@dynamic itemDescription;
@dynamic price;

+(NSString *)parseClassName{
    return @"Item";
}

+(void)load{
    [self registerSubclass];
}

@end