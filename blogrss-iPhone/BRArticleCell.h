//
//  BRArticleCell.h
//  blogrss-iPhone
//
//  Created by 罗 日健 on 5/9/14.
//  Copyright (c) 2014 kenlist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRArticleCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) NSString *urlLink;

@end
