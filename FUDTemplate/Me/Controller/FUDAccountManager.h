//
//  FUDAccountManager.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const fud_loginStatusKey;
extern NSString * const fud_userNameKey;
extern NSString * const fud_userIDKey;
extern NSString * const fud_tokenKey;

extern NSNotificationName const FUDLoginStatusDidChangeNotification;

typedef NS_ENUM(NSInteger, FUDLoginStatus) {
    FUDLoginStatusLoggedIn = 1,
    FUDLoginStatusLoggedOut = 2,
};

@interface FUDAccountManager : NSObject

@property (nonatomic, assign, readonly) FUDLoginStatus loginStatus;
@property (nonatomic, copy, readonly) NSString *userName;
@property (nonatomic, copy, readonly) NSString *userID;

+ (instancetype)currentAccount;

@end
