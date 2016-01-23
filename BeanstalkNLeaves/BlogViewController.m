//
//  BlogViewController.m
//  BeanstalkNLeaves
//
//  Created by Poulose Matthen on 13/01/16.
//  Copyright © 2016 Khullad Traders. All rights reserved.
//

#import "BlogViewController.h"

@interface BlogViewController ()

@end

@implementation BlogViewController
@synthesize myWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.activityIndicatorView startAnimating];
    
    NSURLRequest *myURLRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://beanstalknleaves.wordpress.com/"]];
    [myWebView loadRequest:myURLRequest];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [webView.scrollView setContentSize: CGSizeMake(webView.frame.size.width, webView.scrollView.contentSize.height)];
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView setHidesWhenStopped:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error : %@",error);
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
