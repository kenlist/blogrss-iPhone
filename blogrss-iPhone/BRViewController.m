//
//  BRViewController.m
//  blogrss-iPhone
//
//  Created by 罗 日健 on 5/6/14.
//  Copyright (c) 2014 kenlist. All rights reserved.
//

#import "BRViewController.h"
#import <blogrsssdk/blogrsssdk.h>

@interface BRViewController() <BlogRSSSDKDelegate>

@end

@implementation BRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    [BlogRSSSDK sharedSDK].delegate = self;
    [[BlogRSSSDK sharedSDK] fetchRSS];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onRSSFetchedWithRetCode:(int)retCode andRSSInfo:(NSArray *)rssData {
  
}

@end
