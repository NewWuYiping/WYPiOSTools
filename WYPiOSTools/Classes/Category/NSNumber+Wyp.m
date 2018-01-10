//
//  NSNumber+Wyp.m
//  WypLib
//
//  Created by 邬一平 on 15/4/28.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "NSNumber+Wyp.h"

@implementation NSNumber(Wyp)

+(NSNumber *)wyp_roundingWithNum:(float)__num afterPoint:(int)__position mode:(NSRoundingMode)__mode {
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:__mode scale:__position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:__num];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return roundedOunces;;
}

@end
