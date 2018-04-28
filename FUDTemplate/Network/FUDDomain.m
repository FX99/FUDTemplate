//
//  FUDDomain.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/28.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDDomain.h"
#import "FUDServerEnvironment.h"

@implementation FUDDomain

+ (NSString *)appDomain {
    switch (FUDServerEnvironment.currentEnvironment) {
        case FUDServerEnvironmentTypeDevelop:
            return @"http://api.fudo-dev.cn";
            break;
        case FUDServerEnvironmentTypeTest:
            return @"http://api.fudo-test.cn";
            break;
        case FUDServerEnvironmentTypeProduction:
            return @"https://api.fudo.cn";
            break;
    }
}

+ (NSString *)adDomain {
    switch (FUDServerEnvironment.currentEnvironment) {
        case FUDServerEnvironmentTypeDevelop:
            return @"http://ad.fudo-dev.cn";
            break;
        case FUDServerEnvironmentTypeTest:
            return @"http://ad.fudo-test.cn";
            break;
        case FUDServerEnvironmentTypeProduction:
            return @"https://ad.fudo.cn";
            break;
    }
}

@end
