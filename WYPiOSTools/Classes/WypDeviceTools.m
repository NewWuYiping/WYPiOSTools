//
//  WypDevice.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "WypDeviceTools.h"
#import "NSString+Wyp.h"

@implementation WypDeviceTools

+ (double)wyp_converVersion:(NSString *)__version {
    if ([NSString wyp_isEmpty:__version]) {
        return 0;
    }
    NSArray *__versions = [__version componentsSeparatedByString:@"."];
    double __retrunVersion = 0;
    for (int i=0; i<__versions.count; i++) {
        if (i == 0) {
            __retrunVersion += [__versions[i] integerValue]*100;
        }else if (i == 1) {
            __retrunVersion += [__versions[i] integerValue]*10;
        }else if (i == 2) {
            __retrunVersion += [__versions[i] integerValue]*1;
        }
    }
    return __retrunVersion;
}

+ (NSString *)wyp_appVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    CFShow(infoDictionary);
    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Version;
}

+ (NSString *)wyp_appName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)wyp_bundleIdentifier {
     NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}

//返回当前iPhone OS 运行的版本
+ (CGFloat)wyp_iosVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

//返回YES，设备是否支持iPhone
+ (BOOL)wyp_isPhoneSupported {
    return [[UIDevice currentDevice].model wyp_equalsIgnoreCase:@"iPhone"];
}

//返回YES，设备是否iPad
+ (BOOL)wyp_isPad {
#ifdef __IPHONE_3_2
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#else
    return NO;
#endif
}

#pragma mark - 屏幕
+ (CGRect)wyp_screenFrame {
    CGRect _frame = [UIScreen mainScreen].bounds;
    return _frame;
}

+ (CGRect)wyp_appFrame {
    if ([WypDeviceTools wyp_iosVersion] >= 7) {
        return [WypDeviceTools wyp_screenFrame];
    }else{
        CGRect __frame = [UIScreen mainScreen].applicationFrame;
        return __frame;
    }
}

#pragma mark - ToolBar
+ (CGFloat)wyp_toolBarHeight:(UIInterfaceOrientation) __orientation {
    if (UIInterfaceOrientationIsPortrait(__orientation) || [WypDeviceTools wyp_isPad]) {
        return 44.0f;//ToolBar竖屏时的高度
    } else {
        return 33.0f;//ToolBar横屏时的高度
    }
}

#pragma mark - NavigationBar
+ (CGFloat)wyp_navigationBarHeight {
    
    if ([WypDeviceTools wyp_iosVersion] >= 7) {
        return 64.0f;
    }else{
        return 44.0f;
    }
}

+ (CGFloat)wyp_promptNavigationBarHeight {
    if ([WypDeviceTools wyp_iosVersion] >= 7) {
        return 94.0f;
    }else{
        return 74.0f;
    }
}

#pragma mark - 键盘
+ (CGFloat)wyp_isKeyboardVisible {
    UIWindow *__window = [UIApplication sharedApplication].keyWindow;
    return [__window isFirstResponder] == NO;
}

+ (CGFloat)wyp_keyboardHeight:(UIInterfaceOrientation) _orientation {
    if ([WypDeviceTools wyp_isPad] == YES) {
        return UIInterfaceOrientationIsPortrait(_orientation) ? DEFAULT_KEYBOARD_HEIGHT_PAD_V : DEFAULT_KEYBOARD_HEIGHT_PAD_H;
        
    } else {
        return UIInterfaceOrientationIsPortrait(_orientation) ? DEFAULT_KEYBOARD_HEIGHT_PHONE_V : DEFAULT_KEYBOARD_HEIGHT_PHONE_H;
    }
}

#pragma mark - UITableView
//返回分组表格视图cell与屏幕之间的间距，iPad的间距会更大
+ (CGFloat)wyp_groupedUITableCellInset {
    return [WypDeviceTools wyp_isPad] ? DEFAULT_Grouped_TableCell_Inset_PAD : DEFAULT_Grouped_TableCell_Inset_PHONE;
}

+ (NSString *)wyp_JSESSIONID {
    NSString *__returnValue = nil;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        if ([@"JSESSIONID" wyp_equalsIgnoreCase:cookie.name]) {
            __returnValue = cookie.value;
        }
    }
    return __returnValue;
}

//返回文字宽度
+ (CGSize)sizeOfStr:(NSString *)str withFont:(UIFont *)font withMaxWidth:(CGFloat)width withLineBreakMode:(NSLineBreakMode)mode
{
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0){
        CGSize size = [str boundingRectWithSize:CGSizeMake(width, 0) options:3 attributes:@{NSFontAttributeName: font} context:nil].size;
        return size;
    }
    else
    {
        CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, 999999) lineBreakMode:NSLineBreakByWordWrapping];
        return size;
    }
}

@end
