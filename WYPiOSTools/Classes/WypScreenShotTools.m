//
//  WypScreenShotTools.m
//  纳税服务
//
//  Created by 邬一平 on 14-11-26.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import "WypScreenShotTools.h"

@implementation WypScreenShotTools

+ (UIImage *)imageFromView:(UIView *) __theView {
    
    UIGraphicsBeginImageContext(__theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [__theView.layer renderInContext:context];
    UIImage *__returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return __returnImage;
}

+ (UIImage *)imageFromView:(UIView *) __theView  frame:(CGRect)__rect {
    UIGraphicsBeginImageContext(__theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(__rect);
    [__theView.layer renderInContext:context];
    UIImage *__theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  __theImage;
}

+ (UIImage *)imageFromScreen {
    return [WypScreenShotTools imageFromView:[[UIApplication sharedApplication] keyWindow]];
}

@end
