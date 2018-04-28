//
//  FUDServerEnvironment.h
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/28.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FUDServerEnvironmentType) {
    FUDServerEnvironmentTypeDevelop = 1,
    FUDServerEnvironmentTypeTest = 2,
    FUDServerEnvironmentTypeProduction = 3,
};

@interface FUDServerEnvironment : NSObject

@property (nonatomic, assign, class, readonly) FUDServerEnvironmentType currentEnvironment;

@end
