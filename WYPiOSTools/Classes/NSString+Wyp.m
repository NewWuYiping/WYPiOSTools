//
//  NSString+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "NSString+Wyp.h"

#import "NSData+Wyp.h"
#import "WypDeviceTools.h"


@implementation NSString (Wyp)

- (NSString *)wyp_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)wyp_equalsIgnoreCase:(NSString *)__str {
    NSString *__one = [self lowercaseString];
    NSString *__two = [__str lowercaseString];
    return [__one isEqualToString:__two];
}

- (NSRange)wyp_contains:(NSString *)__str {
    return [self rangeOfString:__str];
}

- (NSRange)wyp_containsIgnoreCase:(NSString *)__str {
    NSString *__one = [self lowercaseString];
    NSString *__two = [__str lowercaseString];
    return [__one rangeOfString:__two];
}

+ (BOOL)wyp_isNotEmpty:(NSString *)__str {
    if (__str == nil || [__str isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if([@"" isEqualToString:[__str wyp_trim]]){
        return NO;
    }
    
    if([@"null" wyp_equalsIgnoreCase:[__str wyp_trim]]){
        return NO;
    }
    
    if([@"<null>" wyp_equalsIgnoreCase:[__str wyp_trim]]){
        return NO;
    }
    
    
    if([@"undefined" wyp_equalsIgnoreCase:[__str wyp_trim]]){
        return NO;
    }
    
    return YES;
}

+ (BOOL)wyp_isEmpty:(NSString *)__str {
    return ![NSString wyp_isNotEmpty:__str];
}

- (NSString *)wyp_replaceAllIgnoreCaseWithTag:(NSString *)__tagStr replace:(NSString *)__replaceStr {
    NSString *__return = [self stringByReplacingOccurrencesOfString:[__tagStr uppercaseString] withString:__replaceStr];
    __return = [__return stringByReplacingOccurrencesOfString:[__tagStr lowercaseString] withString:__replaceStr];
    return __return;
}

- (NSString *)wyp_URLEncodedString {
    NSString *__result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                               (CFStringRef)self,
                                                                                               NULL,
                                                                                               CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                               kCFStringEncodingUTF8));
    return __result;
}

- (NSString *)wyp_trimReturn {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
}

- (NSString *)wyp_optimize{
    if (self.length >= 6) {

        return [self stringByReplacingCharactersInRange:NSMakeRange(5, self.length-5) withString:@"..."];
    }

    return self;
}

- (NSString*)wyp_URLDecodedString {
    NSString *__result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                               (CFStringRef)self,
                                                                                                               CFSTR(""),
                                                                                                               kCFStringEncodingUTF8));
    return __result;
}

// string 格式化为 date
- (NSDate *)wyp_dateFromFomate:(NSString*)__formateStr {
    NSDateFormatter *__formatter = [[NSDateFormatter alloc] init];
    [__formatter setDateFormat:__formateStr];
    NSDate *__date = [__formatter dateFromString:self];
    return __date;
}


/*
 - (CGSize)getSize4Font:(UIFont *)__font {
 CGSize size = CGSizeZero;
 if(getVersion() >= 7){
 NSDictionary *attribute = [NSDictionary dictionaryWithObjectsAndKeys:__font, NSFontAttributeName, nil, nil];
 size = [self sizeWithAttributes:attribute];
 }else{
 size = [self sizeWithFont:__font];
 }
 return size;
 }
 */

- (NSString *)wyp_base64Encoding:(NSStringEncoding)__encoding {
    NSData *__data = [self dataUsingEncoding:__encoding];
    return [__data base64EncodedString];
}

- (NSString *)wyp_base64DeEncoded:(NSStringEncoding)__encoding {
    NSData *__data = [NSData dataFromBase64String:self];
    return [[NSString alloc] initWithData:__data encoding:__encoding];
}

- (CGSize)wyp_sizeWithFont:(UIFont *)__font maxSize:(CGSize)__size {
    return [NSString wyp_sizeWithText:self font:__font maxSize:__size];
}

+ (CGSize)wyp_sizeWithText:(NSString *)__text font:(UIFont *)__font maxSize:(CGSize)__size {
    if ([WypDeviceTools wyp_iosVersion] < 7) {
        return [__text sizeWithFont:__font constrainedToSize:__size lineBreakMode:NSLineBreakByWordWrapping];
    }else{
        return [__text boundingRectWithSize:__size
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys:__font,NSFontAttributeName, nil]
                                    context:nil].size;
    }
    
}

- (NSURL *)wyp_2URL {
    return [NSURL URLWithString:self];
}

- (NSDictionary *)wyp_json2Dic {
    NSData *__jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * jsonDic = nil;
    
    NSError *error = nil;
    
    jsonDic =  [NSJSONSerialization JSONObjectWithData:__jsonData options:NSJSONReadingMutableLeaves error:&error];
    return jsonDic;
}

+ (NSString *)wyp_generateUUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    return uuid;
}

+ (NSString *)wyp_encryptedCellNumStr:(NSString *)cellNumStr{
    NSString *str = cellNumStr;
    NSString *encryptedCellNumStr = [str stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    return encryptedCellNumStr;
}

+ (NSString *)wyp_encryptedIDCardNumStr:(NSString *)IDCardNumStr{
    NSString *str = IDCardNumStr;
    NSString *encryptedIDCardNumStr = [str stringByReplacingCharactersInRange:NSMakeRange(3, 11) withString:@"***********"];
    
    return encryptedIDCardNumStr;
}

- (BOOL)isContainsEmoji {
    __block BOOL isEomji = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    isEomji = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                isEomji = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                isEomji = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                isEomji = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                isEomji = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                isEomji = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                isEomji = YES;
            }
        }
    }];
    return isEomji;
}
@end
