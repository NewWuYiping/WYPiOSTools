//
//  NSDate+WYP.m
//  WYPiOSTools
//
//  Created by 邬一平 on 2018/1/11.
//

#import "NSDate+WYP.h"
#import "WypDeviceTools.h"

@implementation NSDate (WYP)

- (void)wyp_logDate {
    WypLog(@"%@", [self wyp_stringFromDate:@"yyyy-MM-dd"]);
}

static NSDateFormatter *formatter;
- (NSString *)wyp_stringFromDate:(NSString *)__dateFormat {
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
    }
    formatter.dateFormat = __dateFormat;
    return [formatter stringFromDate:self];
}

+ (NSString *)wyp_stringFromDateStr:(NSString *)dateStr dateFormat:(NSString *)__dateFormatter{
    NSString *subDateStr;
    if (dateStr.length >=10) {
        subDateStr = [dateStr substringToIndex:10];
    }
    NSString *str = subDateStr;//时间戳
    NSTimeInterval time = [str doubleValue];/* + 28800;//因为时差问题要加8小时 == 28800 sec*/
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:__dateFormatter];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;
}


+ (NSDate *)wyp_convertDateFromString:(NSString *)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    
    return date;
}
@end
