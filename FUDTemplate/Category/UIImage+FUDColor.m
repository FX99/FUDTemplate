//
//  UIImage+FUDColor.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/26.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "UIImage+FUDColor.h"

@implementation UIImage (FUDColor)

+ (UIImage *)fud_imageWithColor:(UIColor *)color {
    CGSize size = CGSizeMake(1.0, 1.0);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
