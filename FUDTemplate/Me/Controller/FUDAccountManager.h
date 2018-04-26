//
//  FUDAccountManager.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const fud_isLoginKey;
extern NSString * const fud_userNameKey;
extern NSString * const fud_tokenKey;
extern NSString * const fud_loginStatusKey;
extern NSNotificationName const FUDLoginStatusDidChangeNotification;

@interface FUDAccountManager : NSObject

@end
