//
//  WebsiteViewController.h
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 13/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebsiteViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

- (IBAction)backButtonPressed:(id)sender;

@end
