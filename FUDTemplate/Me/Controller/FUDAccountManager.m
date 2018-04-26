//
//  FUDAccountManager.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDAccountManager.h"

NSString * const fud_userNameKey = @"FUDUserName";
NSString * const fud_userIDKey   = @"FUDUserID";
NSString * const fud_tokenKey    = @"FUDToken";
NSString * const fud_loginStatusKey = @"FUDLoginStatus";

NSNotificationName const FUDLoginStatusDidChangeNotification = @"FUDLoginStatusDidChangeNotification";

@implementation FUDAccountManager

+ (instancetype)currentAccount {
    static FUDAccountManager *_shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_shareInstance == nil) {
            _shareInstance = [[FUDAccountManager alloc] init];
            [[NSNotificationCenter defaultCenter] addObserver:_shareInstance selector:@selector(didReceiveLoginStatusChangeNotification:) name:FUDLoginStatusDidChangeNotification object:nil];
        }
    });
    return _shareInstance;
}

- (void)didReceiveLoginStatusChangeNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    
    [[NSUserDefaults standardUserDefaults] setValue:userInfo[fud_loginStatusKey] forKey:fud_loginStatusKey];
    [[NSUserDefaults standardUserDefaults] setValue:userInfo[fud_userNameKey] forKey:fud_userNameKey];
    [[NSUserDefaults standardUserDefaults] setValue:userInfo[fud_userIDKey] forKey:fud_userIDKey];
    [[NSUserDefaults standardUserDefaults] setValue:userInfo[fud_tokenKey] forKey:fud_tokenKey];
}

@end
