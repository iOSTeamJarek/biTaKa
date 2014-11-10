//
//  ProfileViewController.h
//  biTaKa
//
//  Created by IV on 11/9/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
-(instancetype)init;
    @property (nonatomic) NSMutableArray *data;
@end
