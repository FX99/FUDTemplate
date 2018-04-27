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
        }
    });
    return _shareInstance;
}

- (FUDLoginStatus)loginStatus {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:fud_loginStatusKey] integerValue];
}

- (NSString *)userName {
    return [[NSUserDefaults standardUserDefaults] valueForKey:fud_userNameKey] ? : @"";
}

- (NSString *)userID {
    return [[NSUserDefaults standardUserDefaults] valueForKey:fud_userIDKey] ? : @"";
}

- (void)updateAccountInfoWithDictionary:(NSDictionary *)accountInfo {
    [[NSUserDefaults standardUserDefaults] setValue:accountInfo[fud_loginStatusKey] forKey:fud_loginStatusKey];
    [[NSUserDefaults standardUserDefaults] setValue:accountInfo[fud_userNameKey] forKey:fud_userNameKey];
    [[NSUserDefaults standardUserDefaults] setValue:accountInfo[fud_userIDKey] forKey:fud_userIDKey];
    [[NSUserDefaults standardUserDefaults] setValue:accountInfo[fud_tokenKey] forKey:fud_tokenKey];
}

- (void)clearAccountInfo {
    [[NSUserDefaults standardUserDefaults] setValue:@(FUDLoginStatusLoggedOut) forKey:fud_loginStatusKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:fud_userNameKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:fud_userIDKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:fud_tokenKey];
}

@end
