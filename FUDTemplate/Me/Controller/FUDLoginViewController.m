//
//  FUDLoginViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/4.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDLoginViewController.h"

@interface FUDLoginViewController ()

@property (nonatomic) UIButton *registerButton;
@property (nonatomic) UIButton *loginButton;

@end

@implementation FUDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerButtonHandler)];
    self.navigationItem.rightBarButtonItem = registerItem;
    [self initSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self layoutSubviews];
}

- (void)initSubviews {
    self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerButton.backgroundColor = [UIColor orangeColor];
    [self.registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.backgroundColor = [UIColor orangeColor];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
}

- (void)layoutSubviews {
    self.registerButton.frame = CGRectMake(100.0, self.topLayoutGuide.length + 20.0, self.view.frame.size.width - 200.0, 40.0);
    self.loginButton.frame = CGRectMake(100.0, CGRectGetMaxY(self.registerButton.frame) + 20.0, self.view.frame.size.width - 200.0, 40.0);
}

- (void)registerButtonHandler {
    FUDRegisterViewController *registerVC = [[FUDRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)loginButtonHandler {
    NSString *userName = @"fudo";
    NSString *userID = @"00000001";
    NSString *token = @"I am token string";
    
    NSDictionary *userInfo = @{fud_userNameKey: userName,
                               fud_userIDKey: userID,
                               fud_tokenKey: token,
                               fud_loginStatusKey: @(FUDLoginStatusLoggedIn)
                               };
    [[FUDAccountManager currentAccount] updateAccountInfoWithDictionary:userInfo];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FUDLoginStatusDidChangeNotification object:nil userInfo:userInfo];
}

@end
