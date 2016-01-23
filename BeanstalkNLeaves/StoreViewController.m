//
//  StoreViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 13/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreTableViewCell.h"
#import "ReviewOrderViewController.h"

@interface StoreViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *resultsArray;
@property (nonatomic, strong) NSMutableArray *quantityArray;
@property (nonatomic, strong) IBOutlet UILabel *alertResponseLabel;
@property (nonatomic, strong) IBOutlet UILabel *actionResponseLabel;

@end

@implementation StoreViewController
@synthesize myTableView, resultsArray, quantityArray, alertResponseLabel, actionResponseLabel, totalOrderLabel, asteriskMessageLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    quantityArray = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Product_Details"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            resultsArray = objects;
            [self populateQuantityArray];
            [myTableView reloadData];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:errorString preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self resetQuantityArray];
    [myTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StoreTableViewCell *cell = (StoreTableViewCell *) [myTableView dequeueReusableCellWithIdentifier:@"StoreTableViewCell"];

    [cell.minusButton addTarget:self action:@selector(minusButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.plusButton addTarget:self action:@selector(plusButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.minusButton.tag = indexPath.row;
    cell.plusButton.tag = indexPath.row;
    cell.minusButton.userInteractionEnabled = YES;
    cell.plusButton.userInteractionEnabled = YES;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    PFObject *tempObject = resultsArray[indexPath.row];
    
    cell.nameLabel.text = [tempObject objectForKey:@"Name"];
    NSString *rupeeSymbol = @"\u20B9";
    cell.priceLabel.text = [NSString stringWithFormat:@"%@%@%@", rupeeSymbol, [tempObject objectForKey:@"Price"], @" x 250g"];
    cell.quantityLabel.text = [NSString stringWithFormat:@"%@", [[quantityArray objectAtIndex:indexPath.row] description]];
    
    [self calculateTotalOrderQuantityLabel];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [resultsArray count];
}

-(void) populateQuantityArray {
    for (int i = 0; i < [resultsArray count]; i++) {
        [quantityArray addObject:[NSNumber numberWithInt:0]];
    }
}

-(void) resetQuantityArray {
    for (int i = 0; i < [resultsArray count]; i++) {
        [quantityArray setObject:[NSNumber numberWithInt:0] atIndexedSubscript:i];
    }
}

-(void) calculateTotalOrderQuantityLabel {
    long totalQuantity = 0;
    for (int i = 0; i < [quantityArray count]; i++) {
        totalQuantity = totalQuantity + [[quantityArray objectAtIndex:i] integerValue];
    }
    totalOrderLabel.text = [NSString stringWithFormat:@"%ld", totalQuantity];
    [totalOrderLabel sizeToFit];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ReviewOrderSegue"]) {
        ReviewOrderViewController *reviewOrderViewController = (ReviewOrderViewController *) segue.destinationViewController;
        reviewOrderViewController.resultsArray = [[NSArray alloc] initWithArray:resultsArray];
        reviewOrderViewController.quantityArray = [[NSMutableArray alloc] initWithArray:quantityArray];
    }
}

-(void) minusButtonPressed:(UIButton *)button {
    NSNumber *rowQuantity = [NSNumber numberWithLong:[[quantityArray objectAtIndex:(long)button.tag] integerValue] - (long)1];
    if ([rowQuantity integerValue] < 0) {
        [quantityArray setObject:[NSNumber numberWithInt:0] atIndexedSubscript:button.tag];
    } else {
        [quantityArray setObject:rowQuantity atIndexedSubscript:button.tag];
    }
    [myTableView reloadData];
}

-(void) plusButtonPressed:(UIButton *)button {
    NSNumber *rowQuantity = [NSNumber numberWithLong:[[quantityArray objectAtIndex:(long)button.tag] integerValue] + (long)1];
    [quantityArray setObject:rowQuantity atIndexedSubscript:button.tag];
    [myTableView reloadData];
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)lockButtonPressed:(id)sender {
}

- (IBAction)asteriskButtonPressed:(id)sender {
    if (asteriskMessageLabel.hidden) {
        [asteriskMessageLabel setHidden:FALSE];
    } else {
        [asteriskMessageLabel setHidden:TRUE];
    }
}


@end
