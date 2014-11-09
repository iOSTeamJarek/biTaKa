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
#import "DetailViewController.h"
#import "MainScreenViewController.h"

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
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Item *it = [self.items objectAtIndex:indexPath.row];
    
    cell.cellItemDescription.text = it.itemDescription;
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    cell.cellItemPrice.text = [NSString stringWithFormat:@"Price: $%@",
                               [fmt stringFromNumber:[NSNumber numberWithFloat:[it.itemPrice floatValue]]]];
    PFFile *thumbnail = it.itemPicture;
    __weak UIImageView *cellImageView = cell.cellItemImage;
    [thumbnail getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        [cell.cellItemImage.layer addAnimation:[self getImageTransition] forKey:nil];
        cellImageView.image = image;
    }];

    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // check for authenticate user
    PFUser *user = [PFUser currentUser];
    
    if (user) {
        [self setLogoutButton];
    }else{
        [self setLoginButton];
    }
    
    __weak id weakSelf = self;
    
    PFQuery *query = [PFQuery queryWithClassName: [Item parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %ld items.", objects.count);
            // Do something with the found objects
            [weakSelf setItems:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf itemTableView] reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
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
    }else if ([segue.identifier isEqualToString:@"toDetailView"]){
        DetailViewController *next = [segue destinationViewController];
        NSIndexPath *path = [self.itemTableView indexPathForSelectedRow];
        Item *c = self.items[path.row];
        [next setItemData: c];
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
    //parseObject[@"itemPicture"] = @"";
    parseObject[@"itemCategory"] = item.itemCategory;
    parseObject[@"itemDescription"] = item.itemDescription;
    parseObject[@"itemPrice"] = item.itemPrice;
    
    [parseObject saveInBackground];
    
    [self alertMessage:@"item added"];
    //[[self itemTableView] reloadData];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) logoutEvent:(id)sender
{
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void) setLogoutButton {
    UIBarButtonItem *logOutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(logoutEvent:)];
    
    self.navigationItem.leftBarButtonItem = logOutButton;
}

- (void) loginEvent:(id)sender
{
    MainScreenViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}

- (void) setLoginButton {
    UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login"
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(loginEvent:)];
    
    self.navigationItem.leftBarButtonItem = loginButton;
}

-(CATransition*)getImageTransition{
    CATransition *trans = [CATransition animation];
    trans.duration = 1.5f;
    trans.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    trans.type = kCATransitionFade;
    return trans;
}
@end