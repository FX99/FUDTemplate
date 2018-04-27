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
    
    UIImage *navigationBarImage = [UIImage fud_imageWithColor:[self prefersNavigationBarColor]];
    UIImage *navigationBarShadowImage = [UIImage fud_imageWithColor:[self prefersNavigationBarShadowColor]];
    [self.navigationController.navigationBar setBackgroundImage:navigationBarImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:navigationBarShadowImage];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.prefersNavigationBarHidden animated:YES];
}

- (BOOL)enableDefaultLeftNavigationBarButton {
    return YES;
}

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

@end
