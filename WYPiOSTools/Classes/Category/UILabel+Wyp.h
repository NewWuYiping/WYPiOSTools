//
//  UILabel+Wyp.h
//
//  Created by 邬一平 on 14-9-17.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Wyp)

- (CGSize)wyp_getAutoHeight:(CGSize)__size;
- (CGSize)wyp_getAutoWidth:(CGSize)__size;

- (CGSize)wyp_getAutoHeight;

- (CGSize)wyp_getAutoWidth;

- (void)wyp_setSpaceH:(long)__space text:(NSString *)__text;

- (void)wyp_setText:(NSString *)__text font:(float)__font textColor:(UIColor *)__textColor textAlignment:(NSTextAlignment)textAlignment;
@end
