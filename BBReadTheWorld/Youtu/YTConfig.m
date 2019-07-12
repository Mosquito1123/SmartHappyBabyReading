//
//  YTConfig.m
//  Youtu
//
//  Created by Kino on 19/01/5.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "YTConfig.h"

@implementation YTConfig

+ (YTConfig *)sharedInstance
{
    static YTConfig *__shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __shared = [[YTConfig alloc] init];
        [__shared setup];
    });
    
    return __shared;
}

/**
 *  配置基本key
 */
- (void)setup
{
    self.appId = @"1003873";
    self.secretId = @"AKIDq3lEBmCzlMdnW9iBFmzuuVoPSNPFIE1l";
    self.secretKey = @"rR5TtoK8bAvhyqUc021H28uBSqotaxlN";
}

@end
