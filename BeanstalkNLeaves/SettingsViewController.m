//
//  SettingsViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)backButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"MainScreenSegue" sender:self];
}

@end
