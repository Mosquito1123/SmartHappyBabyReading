//
//  NSString+Process.m
//  WordRecognition
//
//  Created by Kino on 19/01/7.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "NSString+Process.h"

@implementation NSString (Process)

- (NSString *)pinyin
{
    NSMutableString *pinyin = [self mutableCopy];
    //转换成拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    // 截取首字母
    return pinyin;
}

@end
