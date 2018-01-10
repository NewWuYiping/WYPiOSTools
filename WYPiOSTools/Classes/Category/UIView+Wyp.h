//
//  UIView+Wyp.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Wyp)

+ (void)wyp_logFrame:(CGRect)__rect;
+ (void)wyp_logView:(UIView *)__view;
- (void)wyp_logView;
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v;

- (NSString *)wyp_digView;
- (void)wyp_writeDigView:(NSString *)__url;

- (void)wyp_setViewRadius:(CGFloat)radius
                  withColor:(UIColor *)color
                  withWidth:(CGFloat)width;
@end
