//
//  MainAdViewController.m
//  biTaKa
//
//  Created by Admin on 28/10/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainAdViewController.h"
#import <Parse/Parse.h>
#import "Item.h"
#import "ItemTableViewCell.h"

@interface MainAdViewController ()

@end

@implementation MainAdViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.items = [NSMutableArray array];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.items = [NSMutableArray array];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        self.items = [NSMutableArray array];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

static NSString* cellIdentifier = @"itemCell";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //cell.imageView.image = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [[self.items objectAtIndex:indexPath.row] description];
    cell.textLabel.text = [[[self.items objectAtIndex:indexPath.row] price] stringValue];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak id weakSelf = self;

    PFQuery *query = [PFQuery queryWithClassName: [Item parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld scores.", objects.count);
            // Do something with the found objects
            [weakSelf setItems:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf itemTableView] reloadData];

//            for (PFObject *object in self.items) {
//                NSLog(@"%@", object);
//            }

        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    //[query orderByAscending:@"name"];
    //    query.skip = 2;
    //    query.limit = 3;
    //    [query whereKey:@"name" containedIn:@[@"Doncho", @"NEW NAME", @"Gosho"]];
    
    //    __weak id weakSelf = self;
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    //        if(!error){
    //            [weakSelf setItems:[NSMutableArray arrayWithArray:objects]];
    //            [[weakSelf itemTableView] reloadData];
    //        }
    //    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toCreateItem"]) {
        if ([segue.destinationViewController isKindOfClass:[CreateAdViewController class]]) {
            CreateAdViewController *destVC = segue.destinationViewController;
            destVC.delegate = self;
        }
    }
}

-(void)alertMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

#pragma mark - CreateAddViewControllerDelegate

-(void)addItem:(Item *)item {
    // update table
    // persist data in Parse
    PFObject *parseObject = [PFObject objectWithClassName:@"Item"];
    parseObject[@"Picture"] = @"";
    parseObject[@"Category"] = item.itemCategory;
    parseObject[@"Description"] = item.itemDescription;
    parseObject[@"Price"] = item.price;
    
    [parseObject saveInBackground];
    
    [self alertMessage:@"item added"];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end