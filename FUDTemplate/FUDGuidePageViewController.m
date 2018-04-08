//
//  FUDGuidePageViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/8.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDGuidePageViewController.h"

@interface FUDGuidePageViewController ()

@end

@implementation FUDGuidePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat height = self.view.frame.size.height;
    CGFloat width  = self.view.frame.size.width;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    for (int i=0; i<4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        if (i == 0) {
            view.backgroundColor = [UIColor orangeColor];
        } else if (i == 1) {
            view.backgroundColor = [UIColor greenColor];
        } else if (i == 2) {
            view.backgroundColor = [UIColor blueColor];
        } else if (i == 3) {
            view.backgroundColor = [UIColor lightGrayColor];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(100, height-100, width-200, 40);
            button.backgroundColor = [UIColor orangeColor];
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonHandler) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
        }
        
        [scrollView addSubview:view];
    }
    scrollView.contentSize = CGSizeMake(4*self.view.frame.size.width, self.view.frame.size.height);
}

- (void)buttonHandler {
    
}

@end
