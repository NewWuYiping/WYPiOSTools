//
//  NSData+Wyp.h
//  wyp_ios
//
//  Created by 邬一平 on 16/8/2.
//  Copyright © 2016年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Date1970(VALUE) ([NSDate dateWithTimeIntervalSince1970:VALUE/1000])

void *NewBase64Decode(
                      const char *inputBuffer,
                      size_t length,
                      size_t *outputLength);

char *NewBase64Encode(
                      const void *inputBuffer,
                      size_t length,
                      bool separateLines,
                      size_t *outputLength);
@interface NSData(Wyp)

+ (NSData *)dataFromBase64String:(NSString *)aString;
- (NSString *)base64EncodedString;

//把字符串加密成32位小写md5字符串
+ (NSString*)md532BitLower:(NSString *)inPutText;

//把字符串加密成32位大写md5字符串
+ (NSString*)md532BitUpper:(NSString*)inPutText;


- (void)wyp_logDate;

- (NSString *)wyp_stringFromDate:(NSString *)__dateFormat;
//时间戳转换为时间
+ (NSString *)wyp_stringFromDateStr:(NSString *)dateStr dateFormat:(NSString *)__dateFormatter;

//NSString转化为NSDate
+ (NSDate *)wyp_convertDateFromString:(NSString*)dateStr;
@end
