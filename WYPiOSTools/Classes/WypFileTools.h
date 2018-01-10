//
//  WypFileTools.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WypFileTools : NSObject
//获取documents下的文件路径
+ (NSString *)wyp_documentsPath:(NSString *)__fileName;

+ (BOOL)wyp_saveFile2Document:(NSData *)__data withName:(NSString *)__name;

+ (BOOL)wyp_deleteFileFromDocument:(NSString *)__name;

+ (BOOL)wyp_isExist:(NSString *)__path;
@end
