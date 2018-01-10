//
//  UIButton+Wyp.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Wyp)

- (void)wyp_setTitle:(NSString *)__title;
- (void)wyp_setTitleColor:(UIColor *)__color;
- (void)wyp_setTitle:(NSString *)__title color:(UIColor *)__color;

- (void)wyp_setImage:(UIImage *)__image;

- (void)wyp_setTitle:(NSString *)__title
          titleColor:(UIColor *)__color
               image:(UIImage *)__image
     backgroundImage:(UIImage *)__bgImage
               state:(UIControlState)__state;

- (void)wyp_setTitleColor:(UIColor *)__titleColor
          backgroundImgae:(NSString *)__bgImage
                    state:(UIControlState)__state;

- (void)wyp_setButtonRadius:(CGFloat)radius
                  withColor:(UIColor *)color
                  withWidth:(CGFloat)width;
@end
