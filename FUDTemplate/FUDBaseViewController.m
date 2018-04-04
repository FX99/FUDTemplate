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

- (BOOL)enableDefaultLeftNavigationBarButton {
    return YES;
}

- (void)setDefaultLeftNavigationBarButton {
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count > 1) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonHandler)];
        } else {
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
