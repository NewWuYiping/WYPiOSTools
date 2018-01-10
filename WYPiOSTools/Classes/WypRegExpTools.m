//
//  WypRegExpTools.m
//  WypLib
//
//  Created by 邬一平 on 15/4/3.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "WypRegExpTools.h"

@implementation WypRegExpTools

+ (BOOL)wyp_validateEmail:(NSString *)__email {
    NSString *__emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}";
    NSPredicate *__emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", __emailRegex];
    return [__emailTest evaluateWithObject:__email];
}
@end
