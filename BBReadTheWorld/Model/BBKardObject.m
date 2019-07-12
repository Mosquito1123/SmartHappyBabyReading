//
//  Card.m
//  WordRecognition
//
//  Created by Kino on 19/03/19.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "BBKardObject.h"
#import <FMDB.h>
#import "NSString+Process.h"

@implementation BBKardObject

- (NSString *)description {
    return [NSString stringWithFormat:@"chinese = %@, english = %@, pinyin = %@ count = %lu identifier = %lu", self.chinese, self.english, self.pinyin, (unsigned long)self.imageCounts, (unsigned long)self.identifier];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.identifier = NSIntegerMin;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    id p = [[self class] allocWithZone:zone];
    [p setImageCounts:_imageCounts chinese:_chinese pinyin:_pinyin english:_english images:_images identifier:_identifier];
    return p;
}

#pragma mark custom
- (void)setChinese:(NSString *)chinese {
    _chinese = chinese;
    _pinyin = [chinese pinyin];
}

- (void)setImageCounts:(NSUInteger)imageCounts chinese:(NSString *)chinese pinyin:(NSString *)pinyin english:(NSString *)english images:(NSArray *)images identifier:(NSInteger)identifier {
    _imageCounts = imageCounts;
    _chinese = chinese;
    _pinyin = pinyin;
    _english = english;
    _images = [images mutableCopy];
    _identifier = identifier;
}

@end
