//
//  PickImageViewController.h
//  Youtu
//
//  Created by Kino on 19/01/7.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "BaseViewController.h"

@interface PickImageViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImage *originalImage;

- (void)chooseImage;

- (void)photoLib;
- (void)takePhoto;

@end
