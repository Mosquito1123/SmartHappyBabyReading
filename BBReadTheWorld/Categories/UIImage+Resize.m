//
//  UIImage+Resize.m
//  WordRecognition
//
//  Created by Kino on 19/01/8.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "UIImage+Resize.h"
#import "UIConstants.h"

@import QuartzCore;

@implementation UIImage (Resize)

+ (UIImage *)cutImage:(UIImage *)originImage size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, SCREEN_SCALE);
    //    UIGraphicsBeginImageContext(size); //size 为CGSize类型，即你所需要的图片尺寸
    [originImage drawInRect:CGRectMake(0, 0, size.height, size.width)]; //newImageRect指定了图片绘制区域
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
