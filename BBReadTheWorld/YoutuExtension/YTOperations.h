//
//  YTOperations.h
//  Youtu
//
//  Created by Kino on 19/01/7.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TXQcloudFrSDK.h"
#import "YTConfig.h"
#import "Auth.h"

#import "YTTagModel.h"

@interface YTOperations : NSObject

/**
 *  识别图像的tags
 *
 *  @param image <#image description#>
 *  @param block <#block description#>
 */
+ (void)identifyImage:(UIImage *)image ok:(void (^)(NSArray *array, NSError *error))block;

@end
