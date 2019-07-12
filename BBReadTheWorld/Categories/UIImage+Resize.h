//
//  UIImage+Resize.h
//  WordRecognition
//
//  Created by Kino on 19/01/8.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/**
 *  设置大小
 *
 *  @param originImage <#originImage description#>
 *  @param size        <#size description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)cutImage:(UIImage *)originImage size:(CGSize)size;

@end
