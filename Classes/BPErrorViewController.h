//
//  BPErrorViewController.h
//  BPErrorView
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPErrorViewController : UIViewController

+ (instancetype)errorViewController;

+ (instancetype)errorViewControllerWithImage:(UIImage *)image text:(NSString *)text;

@property (copy, nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *text;
@end
