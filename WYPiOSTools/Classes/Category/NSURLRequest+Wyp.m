//
//  NSURLRequest+Wyp.m
//  WypLib
//
//  Created by 邬一平 on 16/3/21.
//  Copyright © 2016年 邬一平. All rights reserved.
//

#import "NSURLRequest+Wyp.h"

@implementation NSURLRequest (Wyp)

- (NSURLRequest *)wyp_requestWithHeaderFields:(NSDictionary<NSString *, NSString *> *)__headerFields {
    
    NSMutableDictionary<NSString *, NSString *> *__all = [NSMutableDictionary dictionaryWithDictionary:self.allHTTPHeaderFields ? self.allHTTPHeaderFields : @{}];
    [__all addEntriesFromDictionary:__headerFields];
    
    NSMutableURLRequest *__request = [self mutableCopy];
    
    for (NSString *__key in __all.allKeys) {
        [__request setValue:__all[__key] forHTTPHeaderField:__key];
    }
    return [__request copy];
}
@end
