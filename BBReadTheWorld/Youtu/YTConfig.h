//
//  YTConfig.h
//  Youtu
//
//  Created by Kino on 19/01/5.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTConfig : NSObject

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *secretId;
@property (nonatomic, copy) NSString *secretKey;

@property (nonatomic, copy) NSString *userId;

/**
 *  单例
 *
 *  @return 单例
 */
+ (YTConfig *)sharedInstance;

@end
