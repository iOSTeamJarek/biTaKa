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

static int Min_Lenght_Description = 10;

@dynamic itemPicture;
@dynamic itemName;
@dynamic itemCategory;
@dynamic itemDescription;
@dynamic itemPrice;

+(NSString *)parseClassName{
    return @"Item";
}

+(void)load{
    [self registerSubclass];
}

// TODO: Refactor code with constants
// Tip: Handling Alert box in UI with raisin ERROR in setters

-(void)setItemCategory:(NSString *)itemCategory{
    
    // TODO: handle alert box
    if ([itemCategory isEqual:nil]) {
        NSLog(@"No category Selected");
    }
    
    self.itemCategory = itemCategory;
}

-(void) setItemDescription:(NSString *)itemDescription{
    if ([itemDescription length] <= Min_Lenght_Description) {
        // Raise error
    }
    
    self.itemDescription = itemDescription;
}

-(void) setPrice:(NSNumber *)price{
    if (price < 0) {
        //Raise no negative error
    }
    
    self.price = price;
}

// Here we check in the view for currentUser so no need to check if it exists
-(void) setOwner:(PFUser *)owner{
    self.owner = owner;
}

@end