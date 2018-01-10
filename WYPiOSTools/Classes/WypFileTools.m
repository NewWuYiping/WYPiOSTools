//
//  WypFileTools.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "WypFileTools.h"
#import "WypDeviceTools.h"

@implementation WypFileTools

+ (NSString *)wyp_documentsPath:(NSString *)__fileName {
    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return  [documents stringByAppendingPathComponent:__fileName];
}

+ (BOOL)wyp_saveFile2Document:(NSData *)__data withName:(NSString *)__name {
    NSString *__path = [WypFileTools wyp_documentsPath:__name];
    BOOL __result = [__data writeToFile:__path atomically:NO];
    WypLog(@"%s, %@, %d", __FUNCTION__, __path, __result);
    
    return __result;
}

+ (BOOL)wyp_deleteFileFromDocument:(NSString *)__name {
    NSString *__path = [WypFileTools wyp_documentsPath:__name];
    return [[NSFileManager defaultManager] removeItemAtPath:__path error:nil];
}

+ (BOOL)wyp_isExist:(NSString *)__path {
    NSFileManager *__fileManager = [NSFileManager defaultManager];
    BOOL __isExist = [__fileManager fileExistsAtPath:__path isDirectory:nil];
    return __isExist;
}

@end
