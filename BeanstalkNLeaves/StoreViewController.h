//
//  StoreViewController.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 13/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface StoreViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UILabel *totalOrderLabel;
@property (strong, nonatomic) IBOutlet UILabel *asteriskMessageLabel;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)lockButtonPressed:(id)sender;
- (IBAction)asteriskButtonPressed:(id)sender;

@end
