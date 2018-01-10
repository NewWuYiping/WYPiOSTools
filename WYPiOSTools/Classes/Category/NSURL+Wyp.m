//
//  NSURL+Wyp.m
//  CaProtector
//
//  Created by 邬一平 on 14-12-3.
//  Copyright (c) 2014年 上海伊文科技有限公司. All rights reserved.
//

#import "NSURL+Wyp.h"

@implementation NSURL (Wyp)

- (NSString *)wyp_getParameter:(NSString *)__paraName {
    NSError *__error;
    NSString *__regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",__paraName];
    NSRegularExpression *__regex = [NSRegularExpression regularExpressionWithPattern:__regTags
                                                                             options:NSRegularExpressionCaseInsensitive
                                                                               error:&__error];
    NSArray *__matches = [__regex matchesInString:self.absoluteString
                                          options:0
                                            range:NSMakeRange(0, [self.absoluteString length])];
    for (NSTextCheckingResult *__match in __matches) {
        NSString *__value = [self.absoluteString substringWithRange:[__match rangeAtIndex:2]];  // 分组2所对应的串
        return __value;
    }
    return @"";
}

@end
