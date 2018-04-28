//
//  FUDNetworkManager.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/27.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDNetworkManager.h"
#import "AFNetworking.h"

@implementation FUDNetworkManager

+ (instancetype)sharedManager {
    static FUDNetworkManager *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[FUDNetworkManager alloc] init];
        }
    });
    return _sharedInstance;
}

- (void)get:(NSString *)URLString parameters:(NSDictionary *)parameters responseHandler:(FUDNetworkResponseHandler)responseHandler {
    NSDictionary *finalParameters = [self generateFinalParameters:parameters];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager GET:URLString parameters:finalParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successWithResponseObject:responseObject responseHandler:responseHandler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failureWithError:error responseHandler:responseHandler];
    }];
}

- (void)post:(NSString *)URLString parameters:(NSDictionary *)parameters responseHandler:(FUDNetworkResponseHandler)responseHandler {
    NSDictionary *finalParameters = [self generateFinalParameters:parameters];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    [sessionManager POST:URLString parameters:finalParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self successWithResponseObject:responseObject responseHandler:responseHandler];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self failureWithError:error responseHandler:responseHandler];
    }];
}

#pragma mark - 私有方法

- (NSDictionary *)generateFinalParameters:(NSDictionary *)parameters {
    NSDictionary *newParameters = [self setupPublicParameters:parameters];
    return [self signParameters:newParameters];
}

- (NSDictionary *)setupPublicParameters:(NSDictionary *)parameters {
    NSMutableDictionary *newParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    newParameters[@"appType"] = @"iOS";
    newParameters[@"appVersion"] = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    return newParameters.copy;
}

- (NSDictionary *)signParameters:(NSDictionary *)parameters {
    // 签名
    
    return parameters;
}

- (void)successWithResponseObject:(id)responseObject responseHandler:(FUDNetworkResponseHandler)responseHandler {
    if (responseHandler) {
        NSInteger code = [responseObject[@"code"] integerValue];
        NSString *message = responseObject[@"msg"];
        id data = responseObject[@"data"];
        
        responseHandler(code, message, data);
    }
}

- (void)failureWithError:(NSError *)error responseHandler:(FUDNetworkResponseHandler)responseHandler {
    if (responseHandler) {
        responseHandler(error.code, error.localizedDescription, nil);
    }
}

@end
