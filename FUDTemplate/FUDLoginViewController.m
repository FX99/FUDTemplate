//
//  FUDLoginViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/4.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDLoginViewController.h"

@interface FUDLoginViewController ()

@end

@implementation FUDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(100, 300, self.view.frame.size.width - 200, 40);
    registerButton.backgroundColor = [UIColor orangeColor];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:registerButton];
}

- (void)registerButtonHandler {
    FUDRegisterViewController *registerVC = [[FUDRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
