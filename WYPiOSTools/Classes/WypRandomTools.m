//
//  WypRandomTools.m
//
//  Created by 邬一平 on 14-9-19.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypRandomTools.h"

@implementation WypRandomTools


+ (NSInteger)randomInt4Size:(NSInteger)__size {
    NSInteger __from = 10 * (__size - 1);
    NSInteger __to = 10 * __size;
    return [WypRandomTools randomInt4Range:WypMakeRange(__to, __from)];
}

+ (NSInteger)randomInt4Range:(WypRange)__range {
    return (NSInteger)(__range.from + (arc4random() % (__range.to - __range.from + 1)));
}
@end
