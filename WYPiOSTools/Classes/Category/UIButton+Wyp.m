//
//  UIButton+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "UIButton+Wyp.h"
#import "NSString+Wyp.h"
#import <objc/runtime.h>

@interface UIButton ()
- (void)__callActionBlock:(id)sender;
@end

@implementation UIButton (Wyp)

- (void)wyp_setTitle:(NSString *)__title {
    [self setTitle:__title forState:UIControlStateNormal];
    [self setTitle:__title forState:UIControlStateHighlighted];
    [self setTitle:__title forState:UIControlStateSelected];
    [self setTitle:__title forState:UIControlStateDisabled];
}

- (void)wyp_setTitleColor:(UIColor *)__color {
    [self setTitleColor:__color forState:UIControlStateNormal];
    [self setTitleColor:__color forState:UIControlStateHighlighted];
}

- (void)wyp_setTitle:(NSString *)__title color:(UIColor *)__color {
    if ([NSString wyp_isNotEmpty:__title]) {
        [self wyp_setTitle:__title];
    }
    if (__color != nil) {
        [self wyp_setTitleColor:__color];
    }
}

- (void)wyp_setImage:(UIImage *)__image {
    [self setImage:__image forState:UIControlStateNormal];
    [self setImage:__image forState:UIControlStateHighlighted];
}

- (void)wyp_setTitle:(NSString *)__title
          titleColor:(UIColor *)__titleColor
               image:(UIImage *)__image
     backgroundImage:(UIImage *)__bgImage
               state:(UIControlState)__state {
    if ([NSString wyp_isNotEmpty:__title]) {
        [self setTitle:__title forState:__state];
    }
    if (__titleColor != nil) {
        [self setTitleColor:__titleColor forState:__state];
    }
    if (__image != nil) {
        [self setImage:__image forState:__state];
    }
    if (__bgImage != nil) {
        [self setBackgroundImage:__bgImage forState:__state];
    }
}

- (void)wyp_setTitleColor:(UIColor *)__titleColor
          backgroundImgae:(NSString *)__bgImage
                    state:(UIControlState)__state {
    [self setTitleColor:__titleColor forState:__state];
    [self setBackgroundImage:[UIImage imageNamed:__bgImage] forState:__state];
    
}

- (void)wyp_setButtonRadius:(CGFloat)radius
                  withColor:(UIColor *)color
                  withWidth:(CGFloat)width{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

@end