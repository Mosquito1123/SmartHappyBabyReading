//
//  CardViewController.h
//  WordRecognition
//
//  Created by Kino on 19/03/11.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickImageViewController.h"

typedef NS_ENUM(NSInteger, CardViewStatus){
    CardViewStatusCustom = 0,
    CardViewStatusNormal,
    CardViewStatusEdit,
};

@interface CardViewController : PickImageViewController

@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (nonatomic, assign) CardViewStatus status;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong) NSArray *cardArray;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
