//
//  NetworkManager.h
//  WordRecognition
//
//  Created by Kino on 19/01/7.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

/**
 *  单例
 *
 *  @return <#return value description#>
 */
+ (NSURLSession *)sharedSession;

/**
 *  将中文翻译到英文
 *
 *  @param word  <#word description#>
 *  @param block <#block description#>
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *)translate2English:(NSString *)word ok:(void (^)(NSString *english, NSError *error))block;

@end
