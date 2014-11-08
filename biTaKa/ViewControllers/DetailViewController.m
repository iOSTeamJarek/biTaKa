//
//  DetailViewController.m
//  biTaKa
//
//  Created by IV on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    NSString *text =[NSString stringWithFormat:@"%d", [self.itemData.price intValue]];
    self.lbItemPrice.text = [NSString stringWithFormat:@"%d", [self.itemData.price intValue]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
