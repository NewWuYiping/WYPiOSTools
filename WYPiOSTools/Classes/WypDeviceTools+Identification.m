//
//  WypDeviceTools+Identification.m
//  WypLib
//
//  Created by 邬一平 on 14-12-18.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypDeviceTools+Identification.h"
#import "NSString+Wyp.h"
#import "SSKeychain.h"

@implementation WypDeviceTools(Identification)

static NSString *IdentificationNumber;
+ (NSString *)wyp_identificationNumberWithServiceName:(NSString *)__serviceName acount:(NSString *)__acount{
    if ([NSString wyp_isEmpty:IdentificationNumber]) {
        if ([NSString wyp_isEmpty:__serviceName]) {
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            __serviceName = [infoDictionary objectForKey:@"CFBundleIdentifier"];
            __serviceName = [__serviceName wyp_replaceAllIgnoreCaseWithTag:@"." replace:@"_"];
        }
        if ([NSString wyp_isEmpty:__acount]) {
            __acount = @"default";
        }
        IdentificationNumber =  [SSKeychain passwordForService:__serviceName account:__acount];
        if ([NSString wyp_isEmpty:IdentificationNumber]) {
            CFStringRef __uuidRef = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
            IdentificationNumber = [NSString stringWithFormat:@"%@", __uuidRef];
            IdentificationNumber = [IdentificationNumber wyp_replaceAllIgnoreCaseWithTag:@"-" replace:@"_"];
            [SSKeychain setPassword: IdentificationNumber forService:__serviceName account:__acount];
        }
    }
    
    WypLog(@"\nServiceName = %@\nAcount = %@\nIdentificationNumber = %@\n", __serviceName, __acount, IdentificationNumber);
    return IdentificationNumber;
}
@end
