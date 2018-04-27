//
//  FUDTabBarController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDTabBarController.h"

@interface FUDTabBarController ()

@end

@implementation FUDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage fud_imageWithColor:[UIColor colorWithRed:0.5 green:0.8 blue:1.0 alpha:1.0]];
    self.tabBar.shadowImage = [UIImage fud_imageWithColor:[UIColor colorWithRed:0.5 green:0.8 blue:1.0 alpha:1.0]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]} forState:UIControlStateSelected];
}

@end
