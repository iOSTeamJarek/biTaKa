//
//  AlertUtility.h
//  biTaKa
//
//  Created by IV on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertUtility : UIViewController
+(void)alertWith:(NSString*)title message:(NSString*)message andButton:(NSString*)button;
@end
