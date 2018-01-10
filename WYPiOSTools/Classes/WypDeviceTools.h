//
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
//
//
//  WypDevice.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>



#ifdef DEBUG
#define WypLog(...) NSLog(__VA_ARGS__)
#else
#define WypLog(...)
#endif

#define WYP_LOG_VIEW(__view)\
WypLog(@"------>> x=%.2f, y=%.2f, width=%.2f, height=%.2f", __view.left, __view.top, __view.width, __view.height);

#define IOS_SCREEN_HEIGHT                           ([UIScreen mainScreen].bounds.size.height)
#define IOS_SCREEN_WIDTH                            ([UIScreen mainScreen].bounds.size.width)
#define IOS_SCREEN                                  ([UIScreen mainScreen].bounds)
#define IOS_TABBAR_HEIGHT                            49
#define IOS_SCREEN_SMALL                            (IOS_SCREEN.size.height<568)//判断是4.0还是3.5英寸的屏幕

#define WYP_WINDOW                                  ([[UIApplication sharedApplication].delegate window])
#define WYP_APP                                     ([UIApplication sharedApplication])
#define WYP_APP_DELEGATE                            ([[UIApplication sharedApplication] delegate])//获取AppDelegate
#define WYP_RootViewController                      (WYP_APP_DELEGATE.window.rootViewController)
#define WYP_IOS_VERSION                             ([[UIDevice currentDevice].systemVersion doubleValue])
#define WYP_APP_VERSION                             ([WypDeviceTools wyp_appVersion])
#define WYP_IS_IOS7                                 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7)
#define WYP_NAV_HEIGHT                              ([WypDeviceTools wyp_navigationBarHeight])
#define WYP_STATUS_BAR_HEIGHT                       ([[UIApplication sharedApplication] statusBarFrame].size.height)//20



@interface WypDeviceTools : NSObject

+ (double)wyp_converVersion:(NSString *)__version;

+ (NSString *)wyp_appVersion;

+ (NSString *)wyp_appName;

+ (NSString *)wyp_bundleIdentifier;

//返回当前iPhone OS 运行的版本
+ (CGFloat)wyp_iosVersion;

//返回YES，设备是否支持iPhone
+ (BOOL)wyp_isPhoneSupported;

//返回YES，设备是否iPad
+ (BOOL)wyp_isPad;

#pragma mark - 屏幕
+ (CGRect)wyp_screenFrame;
+ (CGRect)wyp_appFrame;

#pragma mark - ToolBar
+ (CGFloat)wyp_toolBarHeight:(UIInterfaceOrientation) __orientation;

#pragma mark - NavigationBar
+ (CGFloat)wyp_navigationBarHeight;
+ (CGFloat)wyp_promptNavigationBarHeight;

+ (CGSize)sizeOfStr:(NSString *)str withFont:(UIFont *)font withMaxWidth:(CGFloat)width withLineBreakMode:(NSLineBreakMode)mode;
#pragma mark - 键盘
#define DEFAULT_KEYBOARD_HEIGHT_PHONE_V                             216.0f//键盘的高度_PHONE_竖直
#define DEFAULT_KEYBOARD_HEIGHT_PHONE_V_IOS5_CN                     252.0f//键盘的高度_PHONE_竖直_iOS5_中文
#define DEFAULT_KEYBOARD_HEIGHT_PHONE_H                             162.0f//键盘的高度_PHONE_水平
#define DEFAULT_KEYBOARD_HEIGHT_PHONE_H_IOS5_CN                     198.0f//键盘的高度_PHONE_水平_iOS5_中文
#define DEFAULT_KEYBOARD_HEIGHT_PAD_V                               264.0f//键盘的高度_PAD_竖直
#define DEFAULT_KEYBOARD_HEIGHT_PAD_H                               352.0f//键盘的高度_PAD_水平
+ (CGFloat)wyp_isKeyboardVisible;

#pragma mark - UITableView
#define DEFAULT_TableView_Row_HEIGHT                                44.0f//标准的TableView行高
#define DEFAULT_Grouped_TableCell_Inset_PHONE                       9.0f //分组表格视图cell与屏幕之间的间距_PHONE
#define DEFAULT_Grouped_TableCell_Inset_PAD                         42.0f//分组表格视图cell与屏幕之间的间距_PAD
+ (CGFloat)wyp_groupedUITableCellInset;

+ (NSString *)wyp_JSESSIONID;
@end
