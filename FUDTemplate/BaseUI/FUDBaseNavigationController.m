//
//  FUDBaseNavigationController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/4.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDBaseNavigationController.h"
#import "FUDBaseViewController.h"

@interface FUDBaseNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation FUDBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[FUDBaseViewController class]]) {
        FUDBaseViewController *baseViewController = (FUDBaseViewController *)viewController;
        self.interactivePopGestureRecognizer.enabled = self.viewControllers.count > 1 && baseViewController.enablePopGesture;
    } else {
        self.interactivePopGestureRecognizer.enabled = self.viewControllers.count > 1;
    }
}

@end
