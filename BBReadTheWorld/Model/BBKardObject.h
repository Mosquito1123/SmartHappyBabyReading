//
//  Card.h
//  WordRecognition
//
//  Created by Kino on 19/03/19.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBKardObject : NSObject <NSCopying>

@property (nonatomic, assign) NSUInteger imageCounts;
@property (nonatomic, strong) NSString *chinese;
@property (nonatomic, strong) NSString *pinyin;
@property (nonatomic, strong) NSString *english;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) NSInteger identifier;

- (instancetype)init;
- (id)copyWithZone:(NSZone *)zone;
- (NSString *)description;

@end
