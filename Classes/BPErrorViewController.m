//
//  BPErrorViewController.m
//  BPErrorView
//
//  Created by LiHaozhen on 15/4/19.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "BPErrorViewController.h"

@interface BPErrorViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation BPErrorViewController

+ (instancetype)errorViewController
{
    BPErrorViewController *errorVC = [[UIStoryboard storyboardWithName:@"BPError" bundle:nil] instantiateViewControllerWithIdentifier:@"BPErrorViewController"];
    return errorVC;
}

+ (instancetype)errorViewControllerWithImage:(UIImage *)image text:(NSString *)text
{
    BPErrorViewController *errorVC = [self errorViewController];
    errorVC.image = image;
    errorVC.text = text;
    return errorVC;
}

- (void)awakeFromNib
{
    self.image = [UIImage imageNamed:@"error"];
    self.text = @"没有数据";
}

- (void)setImage:(UIImage *)image
{
    if ([_image isEqual:image]) {
        return;
    }
    _image = [image copy];
    if (self.isViewLoaded) {
        self.imageView.image = image;
    }
}

- (void)setText:(NSString *)text
{
    if ([_text isEqualToString:text]) {
        return;
    }
    _text = [text copy];
    if (self.isViewLoaded) {
        self.textLabel.text = text;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = self.image;
    self.textLabel.text = self.text;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
@end
