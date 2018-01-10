//
//  UIWebView+Wyp.m
//  WypLib
//
//  Created by 邬一平 on 15/5/8.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "UIWebView+Wyp.h"

@implementation UIWebView(Wyp)

- (NSString *)wyp_htmlSource {
    return [self stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('html')[0].innerHTML"];
}

@end
