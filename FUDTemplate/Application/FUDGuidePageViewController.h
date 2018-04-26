//
//  FUDGuidePageViewController.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/8.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSNotificationName const FUDGuidePageDidShowNotification;

@interface FUDGuidePageViewController : UIViewController

+ (BOOL)hasShown;

@end
