//
//  ReviewOrderViewController.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 23/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ReviewOrderViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (nonatomic, strong) NSArray *resultsArray;
@property (nonatomic, strong) NSMutableArray *quantityArray;

- (IBAction)backButtonPressed:(id)sender;
- (IBAction)clearButtonPressed:(id)sender;
- (IBAction)placeOrderButtonPressed:(id)sender;

@end
