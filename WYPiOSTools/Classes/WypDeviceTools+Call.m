//
//  WypDeviceTools+Call.m
//
//  Created by 邬一平 on 14-9-18.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypDeviceTools+Call.h"
#import "WypRandomTools.h"
#import <objc/runtime.h>

@implementation WypDeviceTools (Call)

+ (NSNumber *)wyp_callUp:(NSURL *)__url superView:(UIView *)__view tag:(NSNumber *)__tag{
    UIWebView *__webView = nil;
    if (__tag == nil) {
        __tag = [NSNumber numberWithInteger:[WypRandomTools randomInt4Size:9]];
    }
    __webView = (UIWebView *)[__view viewWithTag:[__tag intValue]];
    if (__webView == nil) {
        __webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        __webView.tag = [__tag intValue];
        [__view addSubview:__webView];
    }
    
    [__webView loadRequest:[NSURLRequest requestWithURL:__url]];
    return [NSNumber numberWithInteger:__webView.tag];
}
@end
