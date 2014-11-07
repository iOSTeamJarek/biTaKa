//
//  ImageUtility.m
//  biTaKa
//
//  Created by IV on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ImageUtility.h"

@implementation ImageUtility

// Encoding Image
+(NSString *)encodeImageToBase64String:(UIImage *)image{
    
    CGImageRef cgref = [image CGImage];
    CIImage *cim = [image CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        // TODO: raise ERROR !!!
        NSLog(@"No Image");
    }
    
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

// Decoding Image
+(UIImage *)decodeBase64StringToImage:(NSString *)base64String{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

//Animating Images
+(UIImage *)changingImagesWithAnimation:(NSArray *)fromImagesArray withFrequence:(NSInteger *)frequence{
    
    
//    CATransition *transition = [CATransition animation];
//    transition.duration = 1.0f;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionFade;
//    
//    [imageView.layer addAnimation:transition forKey:nil];
    
    //TODO Resolve issue with transitions
    
    NSString *str = [NSString stringWithFormat:@"%ld", (long)frequence];
    return [UIImage imageWithContentsOfFile: str];
}

@end
