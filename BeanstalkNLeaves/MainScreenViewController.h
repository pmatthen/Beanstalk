//
//  MainScreenViewController.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScreenViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *sidebarButton;

- (IBAction)storeButtonPressed:(id)sender;
- (IBAction)websiteButtonPressed:(id)sender;
- (IBAction)blogButtonPressed:(id)sender;
- (IBAction)termsAndConditionsButtonPressed:(id)sender;

@end
