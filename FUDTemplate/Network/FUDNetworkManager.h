//
//  FUDNetworkManager.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/27.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^FUDNetworkResponseHandler)(NSInteger code, NSString * _Nullable message, id _Nullable data);

@interface FUDNetworkManager : NSObject

+ (instancetype)sharedManager;

- (void)get:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters responseHandler:(FUDNetworkResponseHandler)responseHandler;

- (void)post:(NSString *)URLString parameters:(NSDictionary * _Nullable)parameters responseHandler:(FUDNetworkResponseHandler)responseHandler;

@end

NS_ASSUME_NONNULL_END
