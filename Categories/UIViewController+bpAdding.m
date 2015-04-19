//
//  UIViewController+bpAdding.m
//  BPErrorView
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "UIViewController+bpAdding.h"

@implementation UIViewController (bpAdding)

- (void)insertToViewController:(UIViewController *)viewController
                       atIndex:(NSInteger)index
                          rect:(CGRect)rect
              autoresizingMask:(UIViewAutoresizing)mask
{
    NSParameterAssert(viewController);
    if ([viewController.childViewControllers containsObject:self]) {
        
        return;
    }
    
    [viewController addChildViewController:self];
    self.view.frame = rect;
    self.view.autoresizingMask = mask;
    [viewController.view insertSubview:self.view atIndex:0];
    [self didMoveToParentViewController:viewController];
}

- (void)addToViewController:(UIViewController *)viewController
                       rect:(CGRect)rect
           autoresizingMask:(UIViewAutoresizing)mask
{
    NSParameterAssert(viewController);
    if ([viewController.childViewControllers containsObject:self]) {
        
        return;
    }
    
    [viewController addChildViewController:self];
    self.view.frame = rect;
    self.view.autoresizingMask = mask;
    [viewController.view addSubview:self.view];
    [self didMoveToParentViewController:viewController];
}

- (void)removeFromViewController:(UIViewController *)viewController
{
    NSParameterAssert(viewController);
    if ([viewController.childViewControllers containsObject:self]) {
        
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
}
@end
