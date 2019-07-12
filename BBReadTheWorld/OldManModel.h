//
//  DDDiaryModel.h
//  XGDiary
//
//  Created by Kino on 2019/3/20.
//  Copyright © 2019 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OldManModel : NSObject

@property (nonnull,strong) NSString * objectId;

@property (nonnull,strong) NSString * avatar;

@property (assign) int age;

@property (assign) int sex;

@property (nonnull,strong) NSString * name;

@end

NS_ASSUME_NONNULL_END
