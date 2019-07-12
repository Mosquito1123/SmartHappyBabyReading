//
//  CardListCollectionViewCell.m
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "CardListCollectionViewCell.h"

@implementation CardListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.status = CardListCellStatusNormal;
    [self.deleteButton removeAllBlocksForControlEvents:UIControlEventTouchUpInside];
    [self.deleteButton addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        [self.delegate didClickDeleteButton:self];
    }];
}

- (void)setStatus:(CardListCellStatus)status {
    _status = status;
    if (status == CardListCellStatusNormal) {
        self.deleteButton.hidden = YES;
    } else if (status == CardListCellStatusEdit) {
        self.deleteButton.hidden = NO;
    }
}

@end
