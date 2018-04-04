//
//  FUDBaseViewController.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/3/30.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FUDBaseViewController : UIViewController

// 是否使用默认的左侧导航栏按钮
@property (nonatomic, readonly) BOOL enableDefaultLeftNavigationBarButton;

// 是否隐藏导航栏
@property (nonatomic, readonly) BOOL prefersNavigationBarHidden;

// 是否启用侧滑返回
@property (nonatomic, readonly) BOOL enablePopGesture;

@end
