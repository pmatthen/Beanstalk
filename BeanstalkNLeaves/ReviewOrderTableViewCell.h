//
//  ReviewOrderTableViewCell.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 23/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewOrderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *quantityLabel;
@property (strong, nonatomic) IBOutlet UIButton *minusButton;
@property (strong, nonatomic) IBOutlet UIButton *plusButton;

@end
