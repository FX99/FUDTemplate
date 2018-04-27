//
//  FUDRegisterViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/4.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDRegisterViewController.h"

@interface FUDRegisterViewController ()

@end

@implementation FUDRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
}

- (UIColor *)prefersNavigationBarColor {
    return [UIColor greenColor];
}

- (UIColor *)prefersNavigationTitleColor {
    return [UIColor blackColor];
}

@end
