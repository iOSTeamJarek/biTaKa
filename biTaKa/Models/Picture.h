//
//  Picture.h
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Parse/Parse.h>

@interface Picture :PFObject<PFSubclassing>

@property(retain) NSString *imageBase64;

+(NSString *)parseClassName;
+(void)load;

@end