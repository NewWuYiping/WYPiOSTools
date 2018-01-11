//
//  NSDate+WYP.h
//  WYPiOSTools
//
//  Created by 邬一平 on 2018/1/11.
//

#import <Foundation/Foundation.h>

#define Date1970(VALUE) ([NSDate dateWithTimeIntervalSince1970:VALUE/1000])
@interface NSDate (WYP)


- (void)wyp_logDate;

- (NSString *)wyp_stringFromDate:(NSString *)__dateFormat;
//时间戳转换为时间
+ (NSString *)wyp_stringFromDateStr:(NSString *)dateStr dateFormat:(NSString *)__dateFormatter;

//NSString转化为NSDate
+ (NSDate *)wyp_convertDateFromString:(NSString*)dateStr;
@end
