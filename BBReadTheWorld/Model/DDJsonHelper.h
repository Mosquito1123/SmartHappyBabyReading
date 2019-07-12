//
//  JSONHelper.h
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDJsonHelper : NSObject

@property (nonatomic, strong) NSDictionary *dataDic;

+ (instancetype)sharedInstance;

- (NSMutableArray *)getCardArrayWithIdentifier:(NSString *)identifier;

@end
