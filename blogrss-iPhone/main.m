//
//  main.m
//  blogrss-iPhone
//
//  Created by 罗 日健 on 5/6/14.
//  Copyright (c) 2014 kenlist. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BRAppDelegate.h"

#import <blogrsssdk/blogrsssdk.h>

int main(int argc, char * argv[])
{
    [[BlogRSSSDK sharedSDK] start];
    
    int ret = 0;
    @autoreleasepool {
        ret = UIApplicationMain(argc, argv, nil, NSStringFromClass([BRAppDelegate class]));
    }
    
    [[BlogRSSSDK sharedSDK] stop];
    return ret;
}
