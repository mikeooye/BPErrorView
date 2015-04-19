//
//  UIViewController+bpAdding.h
//  BPErrorView
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (bpAdding)

- (void)addToViewController:(UIViewController *)viewController
                       rect:(CGRect)rect
           autoresizingMask:(UIViewAutoresizing)mask;

- (void)insertToViewController:(UIViewController *)viewController
                       atIndex:(NSInteger)index
                          rect:(CGRect)rect
              autoresizingMask:(UIViewAutoresizing)mask;

- (void)removeFromViewController:(UIViewController *)viewController;
@end
