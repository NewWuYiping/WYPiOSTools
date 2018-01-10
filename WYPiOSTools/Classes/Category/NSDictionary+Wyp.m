//
//  NSDictionary+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "NSDictionary+Wyp.h"
#import "NSString+Wyp.h"

@implementation NSDictionary (Wyp)

- (id)wyp_objectForKey:(id)__key defaultValue:(id)__default; {
    id __returnValue = nil;
    @try {
        __returnValue= [self objectForKey:__key];
    }@catch (NSException *exception) {
        __returnValue = nil;
    }
    
    if (__returnValue == nil) {
        __returnValue = __default;
    }else if ([__returnValue isKindOfClass:[NSNull class]]) {
         __returnValue = __default;
    }else if ([__returnValue isKindOfClass:[NSString class]] && [NSString wyp_isEmpty:__returnValue]) {
        __returnValue = __default;
    }
    
    return __returnValue;
}

- (id)wyp_objectForKeys:(NSArray *)__keys isOption:(BOOL)__isOption defaultValue:(id)__value; {
    id __returnValue = nil;
    NSException *__exception = nil;
    for (id __obj in __keys) {
        @try {
            __returnValue= [self objectForKey:__obj];
            if (__returnValue != nil && __returnValue != [NSNull null]) {
                break;
            }
        }@catch (NSException *exception) {
            __returnValue = nil;
            __exception = exception;
        }
    }
    
    if (__returnValue == nil && __isOption == NO) {
        @throw __exception;
    }
    
    if (__returnValue == nil && __isOption == YES) {
        return __value;
    }
    
    return __returnValue;
}

- (NSString *)wyp_convert2JsonWithEncoding:(NSStringEncoding)encoding {
    NSData *__jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:__jsonData encoding:encoding];
}

- (NSString *)wyp_convert2Json {
    return [self wyp_convert2JsonWithEncoding:NSUTF8StringEncoding];
}

@end
