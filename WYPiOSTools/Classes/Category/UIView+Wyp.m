//
//  UIView+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "UIView+Wyp.h"
#import "WypDeviceTools.h"

@implementation UIView (Wyp)

+ (void)wyp_logFrame:(CGRect)__rect {
    WypLog(@"x=%.3f, y=%.3f, width=%.3f, height=%.3f", __rect.origin.x, __rect.origin.y, __rect.size.width, __rect.size.height);
}

+ (void)wyp_logView:(UIView *)__view {
    [UIView wyp_logFrame:__view.frame];
}

- (void)wyp_logView {
    [UIView wyp_logView:self];
}

+ (CGRect)relativeFrameForScreenWithView:(UIView *)v {
    CGFloat screenHeight = [WypDeviceTools wyp_appFrame].size.height;
    
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}

- (NSString *)wyp_digView {
#ifdef DEBUG
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child wyp_digView];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", self.class];
    
    return xml;
#else
    return nil;
#endif
}

- (void)wyp_writeDigView:(NSString *)__url {
#ifdef DEBUG
    [[self wyp_digView] writeToFile:__url atomically:YES encoding:NSUTF8StringEncoding error:nil];
#endif
}

- (void)wyp_setViewRadius:(CGFloat)radius
                  withColor:(UIColor *)color
                  withWidth:(CGFloat)width{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    if (!color) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    if (!width) {
        self.layer.borderWidth = 1.0f;
    }
}

@end
