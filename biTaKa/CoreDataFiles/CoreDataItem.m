//
//  CoreDataItem.m
//  biTaKa
//
//  Created by Admin on 09/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CoreDataItem.h"


@implementation CoreDataItem

@dynamic itemName;
@dynamic itemCategory;
@dynamic itemPrice;
@dynamic itemDescription;

-(instancetype)initWithName:(NSString *)iName
                  iCategory:(NSString *)iCat
                     iPrice:(NSDecimalNumber *)iPrice
               iDescription:(NSString *)iDesc{
    
    self = [super init];
    if (self) {
        
        self.itemName = iName;
        self.itemPrice = iPrice;
        self.itemCategory = iCat;
        self.itemDescription = iDesc;
        
    }
    return self;
}

@end