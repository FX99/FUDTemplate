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
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    
    for (int i=0; i<4; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        if (i == 0) {
            view.backgroundColor = [UIColor orangeColor];
        } else if (i == 1) {
            view.backgroundColor = [UIColor greenColor];
        } else if (i == 2) {
            view.backgroundColor = [UIColor blueColor];
        } else if (i == 3) {
            view.backgroundColor = [UIColor lightGrayColor];
        }
        
        [scrollView addSubview:view];
    }
    scrollView.contentSize = CGSizeMake(4*self.view.frame.size.width, self.view.frame.size.height);
}

@end
