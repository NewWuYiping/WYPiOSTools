//
//  NSString+Wyp.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Wyp)

- (NSString *)wyp_trim;
- (BOOL)wyp_equalsIgnoreCase:(NSString *)__str;

- (NSRange)wyp_contains:(NSString *)__str;
- (NSRange)wyp_containsIgnoreCase:(NSString *)__str;

+ (BOOL)wyp_isEmpty:(NSString *)__str;
+ (BOOL)wyp_isNotEmpty:(NSString *)__str;

- (NSString *)wyp_replaceAllIgnoreCaseWithTag:(NSString *)__tagStr replace:(NSString *)__replaceStr;

- (NSString *)wyp_URLEncodedString;
- (NSString *)wyp_URLDecodedString;

// string 格式化为 date
- (NSDate *)wyp_dateFromFomate:(NSString*)__formateStr;

//去除回车
- (NSString *)wyp_trimReturn;

//字符串过长优化
- (NSString *)wyp_optimize;

//- (CGSize)getSize4Font:(UIFont *)__font;
- (NSString *)wyp_base64Encoding:(NSStringEncoding)__encoding;
- (NSString *)wyp_base64DeEncoded:(NSStringEncoding)__encoding;


- (CGSize)wyp_sizeWithFont:(UIFont *)__font maxSize:(CGSize)__size;

+ (CGSize)wyp_sizeWithText:(NSString *)__text font:(UIFont *)__font maxSize:(CGSize)__size;

- (NSURL *)wyp_2URL;

- (NSDictionary *)wyp_json2Dic;

+ (NSString *)wyp_generateUUID;
+ (NSString *)wyp_encryptedCellNumStr:(NSString *)cellNumStr;
+ (NSString *)wyp_encryptedIDCardNumStr:(NSString *)IDCardNumStr;

- (BOOL)isContainsEmoji;
@end
