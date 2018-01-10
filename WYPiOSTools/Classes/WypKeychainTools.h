//
//  WypKeychainTools.h
//  WypLib
//
//  Created by 邬一平 on 15/4/24.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WypKeychainTools : NSObject

+ (void)wyp_saveService:(NSString *)__service data:(id)__data;
+ (id)wyp_loadService:(NSString *)__service;
+ (void)wyp_deleteService:(NSString *)__service;

@end
