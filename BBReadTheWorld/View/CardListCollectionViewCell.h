//
//  CardListCollectionViewCell.h
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardListCollectionViewCell;

@protocol CardListCollectionViewCellDelegate <NSObject>

- (void)didClickDeleteButton:(CardListCollectionViewCell *)cell;

@end

typedef NS_ENUM(NSUInteger, CardListCellStatus) {
    CardListCellStatusNormal = 0,
    CardListCellStatusEdit,
};

@interface CardListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (nonatomic, assign) CardListCellStatus status;
@property (nonatomic, weak) id<CardListCollectionViewCellDelegate> delegate;

@end
