//
//  BRWebViewController.m
//  blogrss-iPhone
//
//  Created by 罗 日健 on 5/9/14.
//  Copyright (c) 2014 kenlist. All rights reserved.
//

#import "BRWebViewController.h"
#import <SVProgressHUD.h>

@interface BRWebViewController () <UIWebViewDelegate>
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation BRWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    self.title = self.urlTitle;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backItemClicked:)];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    [SVProgressHUD showProgress:-1 status:@"Loading..."];
  
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}

- (void)backItemClicked:(id)sender {
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
