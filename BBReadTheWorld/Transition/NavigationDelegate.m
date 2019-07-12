//
//  NavigationDelegate.m
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "NavigationDelegate.h"
#import "CardListViewController.h"
#import "CardViewController.h"
#import "HideButtonTransition.h"
#import "ShowButtonTransition.h"
#import "BBHomeViewController.h"

@implementation NavigationDelegate

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[CardViewController class]] && [fromVC isKindOfClass:[CardListViewController class]]) {
        return nil;
    } else if ([toVC isKindOfClass:[CardListViewController class]] && [fromVC isKindOfClass:[CardViewController class]]) {
        return nil;
    } else if ([fromVC isKindOfClass:[BBHomeViewController class]]) {
        HideButtonTransition *transition = [[HideButtonTransition alloc] init];
        return transition;
    } else if ([toVC isKindOfClass:[BBHomeViewController class]]) {
        ShowButtonTransition *transition = [[ShowButtonTransition alloc] init];
        return transition;
    } else {
        return nil;
    }
}

@end
