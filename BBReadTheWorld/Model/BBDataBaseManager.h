//
//  DataBase.h
//  WordRecognition
//
//  Created by Kino on 19/03/19.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBKardObject;

@interface BBDataBaseManager : NSObject

/**
 *  返回单例
 *
 *  @return 
 */
+ (instancetype)sharedInstance;

/**
 *  select all data from table
 *
 *  @param tableName
 *
 *  @return cards array
 */
- (NSMutableArray *)selectAllDataFromTable:(NSString *)tableName;

/**
 *  clear all data from table(especially mine table)
 *
 *  @param tableName
 */
- (void)clearAllDataFromTable:(NSString *)tableName;

/**
 *  delete card from table
 *
 *  @param tableName
 *  @param cards
 */
- (void)deleteDataFromTable:(NSString *)tableName card:(BBKardObject *)cards;

/**
 *  insert data
 *
 *  @param tableName
 *  @param card      
 */
- (void)insertDataIntoTable:(NSString *)tableName card:(BBKardObject *)card;

@end
