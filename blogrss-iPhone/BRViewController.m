//
//  BRViewController.m
//  blogrss-iPhone
//
//  Created by 罗 日健 on 5/6/14.
//  Copyright (c) 2014 kenlist. All rights reserved.
//

#import "BRViewController.h"
#import "BRWebViewController.h"
#import "BRArticleCell.h"
#import <blogrsssdk/blogrsssdk.h>
#import <blogrsssdk/rssinfoitem.h>
#import <SVProgressHUD.h>
#import <SVPullToRefresh.h>

@interface BRViewController() <UITableViewDelegate, UITableViewDataSource, BlogRSSSDKDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *rssItems;
@end

@implementation BRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"GeekLuo Feed";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:244./255. green:136./255. blue:0 alpha:1];
  
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:[BRArticleCell description] bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:[BRArticleCell description]];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    self.tableView.hidden = YES;
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf startLoad];
    }];
    [self.tableView triggerPullToRefresh];
}

- (void)startLoad {
    [SVProgressHUD showProgress:-1 status:@"Loading..."];
    [BlogRSSSDK sharedSDK].delegate = self;
    [[BlogRSSSDK sharedSDK] fetchRSS];
}

- (void)onRSSFetchedWithRetCode:(int)retCode andRSSItems:(NSArray *)rssItems {
    self.rssItems = [NSArray arrayWithArray:rssItems];
    [self.tableView reloadData];
    
    self.tableView.hidden = NO;
    [self.tableView.pullToRefreshView stopAnimating];
    [SVProgressHUD dismiss];
}

#pragma mark - UITableView Delegate & Data Source Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSSInfoItem *rssItem = self.rssItems[indexPath.row];

    BRWebViewController *webViewController = [[BRWebViewController alloc] init];
    webViewController.url = rssItem.link;
    webViewController.urlTitle = rssItem.title;
    [self.navigationController pushViewController:webViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rssItems ? self.rssItems.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BRArticleCell* cell = [tableView dequeueReusableCellWithIdentifier:[BRArticleCell description]];
    if (!cell) {
        cell = [[BRArticleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[BRArticleCell description]];
    }
    RSSInfoItem *rssItem = self.rssItems[indexPath.row];
    cell.titleLabel.text = rssItem.title;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    cell.dateLabel.text = [dateFormatter stringFromDate:rssItem.pubDate];
  
    cell.urlLink = rssItem.link;
    return cell;
}

@end
