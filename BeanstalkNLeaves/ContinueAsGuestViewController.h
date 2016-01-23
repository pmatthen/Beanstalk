//
//  ContinueAsGuestViewController.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContinueAsGuestViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;

- (IBAction)backButtonPressed:(id)sender;

@end
