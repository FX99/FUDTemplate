//
//  FUDBaseNavigationController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/4.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDBaseNavigationController.h"

@interface FUDBaseNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation FUDBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.enabled = self.viewControllers.count > 1;
}

@end
