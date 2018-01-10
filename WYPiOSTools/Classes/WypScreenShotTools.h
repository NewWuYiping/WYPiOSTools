//
//  WypScreenShotTools.h
//  纳税服务
//
//  Created by 邬一平 on 14-11-26.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WypScreenShotTools : NSObject

+ (UIImage *)imageFromView: (UIView *) __theView;
+ (UIImage *)imageFromView:(UIView *) __theView  frame:(CGRect)__rect;
+ (UIImage *)imageFromScreen;

@end
