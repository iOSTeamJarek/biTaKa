//
//  ImageUtility.h
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ImageUtility : NSObject

+(NSString *) encodeImageToBase64String:(UIImage *)image;
+(UIImage *) decodeBase64StringToImage:(NSString *) base64String;
+(UIImage *) changingImagesWithAnimation: (NSArray *) fromImagesArray
                           withFrequence:(NSInteger *) frequence;

@end
