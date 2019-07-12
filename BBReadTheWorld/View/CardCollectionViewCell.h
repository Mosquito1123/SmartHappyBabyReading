//
//  CardCollectionViewCell.h
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardCollectionViewCell;

@protocol CardCollectionViewCellDelegate <NSObject>

- (void)chinesePlayButtonClicked:(NSString *)chinese sender:(id)sender;
- (void)englishPlayButtonClicked:(NSString *)english sender:(id)sender;
- (void)imageBrowserDidScroll:(CardCollectionViewCell *)cell;
- (void)imageBrowserDidEndScroll:(NSUInteger)index cell:(CardCollectionViewCell *)cell;

@end

@interface CardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UILabel *chineseLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinyinLabel;
@property (weak, nonatomic) IBOutlet UILabel *englishLabel;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, assign) NSUInteger indexPath;
@property (nonatomic, weak) id<CardCollectionViewCellDelegate> delegate;

@end
