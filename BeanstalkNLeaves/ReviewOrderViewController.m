//
//  ReviewOrderViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 23/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "ReviewOrderViewController.h"
#import "ReviewOrderTableViewCell.h"

@interface ReviewOrderViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ReviewOrderViewController
@synthesize myTableView, resultsArray, quantityArray, totalAmountLabel;

- (void)viewDidLoad {
    [super viewDidLoad];

    [myTableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviewOrderTableViewCell *cell = (ReviewOrderTableViewCell *) [myTableView dequeueReusableCellWithIdentifier:@"ReviewOrderTableViewCell"];
    
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
    
    [self calculateTotalAmountLabel];
    
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

-(void) calculateTotalAmountLabel {
    float totalAmount = 0;
    for (int i = 0; i < [quantityArray count]; i++) {
        PFObject *tempObject = resultsArray[i];
        totalAmount = totalAmount + ([[quantityArray objectAtIndex:i] integerValue] * [[tempObject objectForKey:@"Price"] integerValue]);
    }
    NSString *rupeeSymbol = @"\u20B9";
    totalAmountLabel.text = [NSString stringWithFormat:@"%@%.0f", rupeeSymbol, totalAmount];
    [totalAmountLabel sizeToFit];
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

- (IBAction)clearButtonPressed:(id)sender {
    [self resetQuantityArray];
    [myTableView reloadData];
}

- (IBAction)placeOrderButtonPressed:(id)sender {
    
}

@end
