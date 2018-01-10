//
//  WypKeychainTools.m
//  WypLib
//
//  Created by 邬一平 on 15/4/24.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "WypKeychainTools.h"
#import "WypDeviceTools.h"
#import "SSKeychain.h"

@implementation WypKeychainTools


+ (NSMutableDictionary *)wyp_getKeychainQuery:(NSString *)__service {
    
    NSMutableDictionary *__dic = [NSMutableDictionary dictionaryWithCapacity:4];
    [__dic setObject:(__bridge id)(kSecClass) forKey:(__bridge id<NSCopying>)(kSecClassGenericPassword)];
    [__dic setObject:__service forKey:(__bridge id)kSecAttrService];
    [__dic setObject:__service forKey:(__bridge id)kSecAttrAccount];
    [__dic setObject:(__bridge id)kSecAttrAccessibleAfterFirstUnlock forKey:(__bridge id)kSecAttrAccessible];
    
    return __dic;
}

+ (void)wyp_saveService:(NSString *)__service data:(id)__data {
    NSMutableDictionary *keychainQuery = [self wyp_getKeychainQuery:__service];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:__data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+ (id)wyp_loadService:(NSString *)__service {
    id ret = nil;
    NSMutableDictionary *__keychainQuery = [self wyp_getKeychainQuery:__service];
    [__keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [__keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef __keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)__keychainQuery, (CFTypeRef *)&__keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)__keyData];
        } @catch (NSException *e) {
#ifdef DEBUG
            WypLog(@"Unarchive of %@ failed: %@", __service, e);
#endif
        } @finally {
        }
    }
    if (__keyData)
        CFRelease(__keyData);
    return ret;
}

+ (void)wyp_deleteService:(NSString *)__service {
    NSMutableDictionary *__keychainQuery = [self wyp_getKeychainQuery:__service];
    SecItemDelete((__bridge CFDictionaryRef)__keychainQuery);
}

@end
