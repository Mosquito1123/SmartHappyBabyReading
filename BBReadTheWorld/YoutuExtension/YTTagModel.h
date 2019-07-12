//
//  YTTagModel.h
//  Youtu
//
//  Created by Kino on 19/01/5.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTTagModel : NSObject

@property (nonatomic, copy  ) NSString  *tag_name;
@property (nonatomic, assign) NSInteger  tag_confidence;


- (id)initWithInfoDic:(NSDictionary *)infoDic;

/**
 *  排好序的数组，以tag_confidence降序排列
 *
 *  @param rawArray <#rawArray description#>
 *
 *  @return <#return value description#>
 */
+ (NSArray *)orderedTAGsWithRawArray:(NSArray *)rawArray;

/**
 *  置信度最高的TAG
 *
 *  @param rawArray <#rawArray description#>
 *
 *  @return <#return value description#>
 */
+ (YTTagModel *)mostPossibleTAG:(NSArray *)orderedArray;

@end
