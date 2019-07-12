//
//  JSONHelper.m
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "DDJsonHelper.h"
#import "BBKardObject.h"

@implementation DDJsonHelper

+ (instancetype)sharedInstance{
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *plist = [[NSBundle mainBundle] pathForResource:@"neizhi" ofType:@"plist"];
        self.dataDic = [NSDictionary dictionaryWithContentsOfFile:plist];
    }
    return self;
}

- (NSMutableArray *)getCardArrayWithIdentifier:(NSString *)identifier {
    NSArray *array = self.dataDic[identifier];
    NSMutableArray *cardArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        BBKardObject *card = [[BBKardObject alloc] init];
        card.chinese = dic[@"chinese"];
        card.english = dic[@"english"];
        card.imageCounts = [dic[@"imageCount"] integerValue];
        card.identifier = 0;
        NSMutableArray *imageArray = [NSMutableArray array];
        for (int i = 1; i <= card.imageCounts; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%d",card.english, i]];
            [imageArray addObject:image];
        }
        card.images = imageArray;
        [cardArray addObject:card];
    }
    return cardArray;
}

@end
