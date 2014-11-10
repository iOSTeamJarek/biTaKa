//
//  ProfileViewController.m
//  biTaKa
//
//  Created by IV on 11/9/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ProfileViewController.h"
#import "AlertUtility.h"
#import "customTableViewCell.h"
#import "Item.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

-(instancetype)init{
    if (self = [super init]) {
        self.data = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[AlertUtility alertWith:@"Array" message:[NSString stringWithFormat:@"%@", self.data] andButton:@"OK"];
    //NSLog(@"%@", self.data);
}

static NSString *cellIdentifier= @"cell";

-(customTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[customTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Item *it = [self.data objectAtIndex:indexPath.row];
    cell.lbDescription.text = it.description;
//    cell.cellItemDescription.text = it.itemDescription;
//    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
//    [fmt setPositiveFormat:@"0.##"];
//    cell.cellItemPrice.text = [NSString stringWithFormat:@"Price: $%@",
//                               [fmt stringFromNumber:[NSNumber numberWithFloat:[it.itemPrice floatValue]]]];
//    PFFile *thumbnail = it.itemPicture;
//    __weak UIImageView *cellImageView = cell.cellItemImage;
//    [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        UIImage *image = [UIImage imageWithData:data];
//        //[cell.cellItemImage.layer addAnimation:[self getImageTransition] forKey:nil];
//        cellImageView.image = image;
    //}];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
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
