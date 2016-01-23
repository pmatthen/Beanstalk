//
//  MainScreenViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 12/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "MainScreenViewController.h"
#import "SWRevealViewController.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ) {
        [self.sidebarButton addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidLayoutSubviews {
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (IBAction)storeButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"StoreSegue" sender:self];
}

- (IBAction)websiteButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"WebsiteSegue" sender:self];
}

- (IBAction)blogButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"BlogSegue" sender:self];
}

- (IBAction)termsAndConditionsButtonPressed:(id)sender {
}
@end
