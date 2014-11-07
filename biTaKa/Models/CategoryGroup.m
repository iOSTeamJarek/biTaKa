//
//  CategoryGroup.m
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CategoryGroup.h"

@implementation CategoryGroup

@dynamic categoryName;

+(NSString *)parseClassName{
    return @"CategoryGroup";
}

+(void)load{
    [self registerSubclass];
}

-(void) setCategoryName:(NSString *)categoryName{
    
    if ([categoryName length] <= 3 || [categoryName isEqual:nil]) {
        
        // TODO: alert to main screen !!!
        NSLog(@"Category must be at least 3 symbols!");
    }
    
    self.categoryName = categoryName;
}

@end
