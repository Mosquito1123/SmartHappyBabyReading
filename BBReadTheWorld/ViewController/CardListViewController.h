//
//  CardListViewController.h
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CardListCollectionViewStatus) {
    CardListCollectionViewStatusNormal = 0,
    CardListCollectionViewStatusEdit,
};

@interface CardListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) CardListCollectionViewStatus status;

@end
