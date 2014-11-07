//
//  Picture.m
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Picture.h"

@implementation Picture

@dynamic imageBase64;

+(NSString *)parseClassName{
    return @"Pcture";
}

+(void)load{
    [self registerSubclass];
}

-(void)setImageBase64:(NSString *)imageBase64{
    if ([imageBase64 length] == 0) {
        // throw error
    }
    
    self.imageBase64 = imageBase64;
}

@end
