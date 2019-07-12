//
//  CardViewModel.h
//  WordRecognition
//
//  Created by Kino on 19/03/11.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBKardObject.h"
#import "CardCollectionViewCell.h"

@interface LLCardViewBindHelper : NSObject

- (void)bindCardCell:(CardCollectionViewCell *)view withCard:(BBKardObject *)card index:(NSNumber *)index num:(NSNumber *)num;

@end
