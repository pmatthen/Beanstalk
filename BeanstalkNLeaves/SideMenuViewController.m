//
//  SideMenuViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SettingsViewController.h"

@interface SideMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *menuArray;

@end

@implementation SideMenuViewController
@synthesize menuArray, sideMenuTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuArray = @[@"Settings", @"Logout"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [sideMenuTableView dequeueReusableCellWithIdentifier:@"title"];
    
    cell.textLabel.text = menuArray[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"SettingsSegue" sender:self];
            break;
        case 1:
            NSLog(@"User wants to logout");
            break;
        default:
            break;
    }
}

@end
