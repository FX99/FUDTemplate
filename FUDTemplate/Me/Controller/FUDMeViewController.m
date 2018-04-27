//
//  FUDMeViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDMeViewController.h"
#import "FUDSettingsViewController.h"

@interface FUDMeViewController ()

@end

@implementation FUDMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(settingsButtonHandler)];
    self.navigationItem.rightBarButtonItem = settingsItem;
}

- (void)settingsButtonHandler {
    FUDSettingsViewController *settingsViewController = [[FUDSettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsViewController animated:YES];
}

- (UIColor *)prefersNavigationBarShadowColor {
    return [UIColor orangeColor];
}

- (BOOL)prefersTabBarHidden {
    return NO;
}

@end
