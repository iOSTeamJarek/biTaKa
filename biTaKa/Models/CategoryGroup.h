//
//  CategoryGroup.h
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CategoryGroup : PFObject<PFSubclassing>

@property(retain) NSString *categoryName;

+(NSString *)parseClassName;
+(void)load;

@end
