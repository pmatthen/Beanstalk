//
//  ContinueAsGuestViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "ContinueAsGuestViewController.h"

@interface ContinueAsGuestViewController ()

@end

@implementation ContinueAsGuestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidLayoutSubviews {
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
