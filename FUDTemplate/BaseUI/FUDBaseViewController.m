//
//  FUDBaseViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/3/30.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDBaseViewController.h"

@interface FUDBaseViewController ()

@end

@implementation FUDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.enableDefaultLeftNavigationBarButton) {
        [self setDefaultLeftNavigationBarButton];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.prefersNavigationBarHidden animated:YES];
    
    UIImage *navigationBarImage = [UIImage fud_imageWithColor:[self prefersNavigationBarColor]];
    UIImage *navigationBarShadowImage = [UIImage fud_imageWithColor:[self prefersNavigationBarShadowColor]];
    [self.navigationController.navigationBar setBackgroundImage:navigationBarImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:navigationBarShadowImage];
    
    self.navigationController.navigationBar.tintColor = [self prefersNavigationBarItemsColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    [titleLabel setTextColor:[self prefersNavigationTitleColor]];
    [titleLabel setText:self.navigationItem.title];
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - 可重写的方法，用来配置控制器

- (BOOL)enableDefaultLeftNavigationBarButton {
    return YES;
}

- (BOOL)prefersNavigationBarHidden {
    return NO;
}

- (BOOL)enablePopGesture {
    return YES;
}

- (UIColor *)prefersNavigationBarColor {
    return [UIColor orangeColor];
}

- (UIColor *)prefersNavigationBarShadowColor {
    return [UIColor lightGrayColor];
}

- (UIColor *)prefersNavigationBarItemsColor {
    return [UIColor whiteColor];
}

- (UIColor *)prefersNavigationTitleColor {
    return [UIColor whiteColor];
}

#pragma mark - 私有方法

- (void)setDefaultLeftNavigationBarButton {
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonHandler)];
        } else if (self.navigationController.presentingViewController) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButtonHandler)];
        }
    }
}

- (void)backButtonHandler {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelButtonHandler {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
