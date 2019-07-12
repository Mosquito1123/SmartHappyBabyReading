//
//  CardViewModel.m
//  WordRecognition
//
//  Created by Kino on 19/03/11.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "LLCardViewBindHelper.h"

@implementation LLCardViewBindHelper

- (void)bindCardCell:(CardCollectionViewCell *)view withCard:(BBKardObject *)card index:(NSNumber *)index num:(NSNumber *)num{
    view.chineseLabel.text = card.chinese;
    view.englishLabel.text = card.english;
    view.pinyinLabel.text = card.pinyin;
    NSArray *subviews = view.imageScrollView.subviews;
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
    view.count = card.imageCounts;
    view.imageArray = card.images;
    view.indexPath = [num integerValue];
    [view layoutIfNeeded];
    [view.imageScrollView scrollRectToVisible:CGRectMake(0, [index intValue] * SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT) animated:NO];
}

@end
