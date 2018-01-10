//
//  UILabel+Wyp.m
//
//  Created by 邬一平 on 14-9-17.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "UILabel+Wyp.h"
#import "WypDeviceTools.h"
#import "NSString+Wyp.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Wyp)


- (CGSize)wyp_getAutoHeight:(CGSize)__size {
    return [self.text wyp_sizeWithFont:self.font maxSize:CGSizeMake(__size.width, MAXFLOAT)];
}

- (CGSize)wyp_getAutoHeight {
    return [self.text wyp_sizeWithFont:self.font maxSize:CGSizeMake(self.frame.size.width, MAXFLOAT)];
}

- (CGSize)wyp_getAutoWidth:(CGSize)__size {
    return [self.text wyp_sizeWithFont:self.font maxSize:CGSizeMake(MAXFLOAT, __size.height)];
}

- (CGSize)wyp_getAutoWidth {
    return [self.text wyp_sizeWithFont:self.font maxSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
}

- (void)wyp_setSpaceH:(long)__space text:(NSString *)__text {
    NSMutableAttributedString *__attributedString =[[NSMutableAttributedString alloc]initWithString:__text];
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&__space);
    [__attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[__attributedString length])];
    CFRelease(num);
    [self setAttributedText:__attributedString];
}

- (void)wyp_setText:(NSString *)__text font:(float)__font textColor:(UIColor *)__textColor textAlignment:(NSTextAlignment)textAlignment{
    self.text = __text;
    self.font = [UIFont systemFontOfSize:__font];
    self.textColor = __textColor;
    [self setTextAlignment:textAlignment];
}
@end
