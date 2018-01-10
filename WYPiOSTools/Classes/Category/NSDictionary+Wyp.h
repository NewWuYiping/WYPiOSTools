//
//  NSDictionary+Wyp.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Wyp)
- (id)wyp_objectForKey:(id)__key defaultValue:(id)__default;
- (id)wyp_objectForKeys:(NSArray *)__keys isOption:(BOOL)__isOption defaultValue:(id)__value;

- (NSString *)wyp_convert2JsonWithEncoding:(NSStringEncoding)encoding;
- (NSString *)wyp_convert2Json;

@end
