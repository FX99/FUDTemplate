//
//  FUDServerEnvironment.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/28.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDServerEnvironment.h"

@implementation FUDServerEnvironment

+ (FUDServerEnvironmentType)currentEnvironment {
#if RELEASEPRODUCTION || DEBUGPRODUCTION
    return FUDServerEnvironmentTypeProduction;
#elif RELEASETEST || DEBUGTEST
    return FUDServerEnvironmentTypeTest;
#else
    return FUDServerEnvironmentTypeDevelop;
#endif
}

@end
