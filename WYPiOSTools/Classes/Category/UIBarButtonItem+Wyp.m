//
//  UIBarButtonItem+Wyp.m
//  纳税服务
//
//  Created by 邬一平 on 14-10-7.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import "UIBarButtonItem+Wyp.h"
#import <objc/runtime.h>
#import "UIControl+Wyp.h"

@interface UIBarButtonItem ()
- (void)__callActionBlock:(id)sender;
@end

@implementation UIBarButtonItem (Wyp)

static char overviewKey;
- (id)initWithTitle:(NSString *)__title
              style:(UIBarButtonItemStyle)__style
          withBlock:(WypActionBlock)__actionBlock {
    
    self = [self initWithTitle:__title style:__style target:self action:@selector(__callActionBlock:)];
    if (self) {
        objc_setAssociatedObject(self, &overviewKey, __actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    return self;
    
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

- (void)__callActionBlock:(id)sender {
    WypActionBlock ___block = (WypActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (___block) {
        ___block(sender);
    }

}
#pragma clang diagnostic pop

+ (instancetype)itemWithImage:(UIImage *)__image highImage:(UIImage *)__highImage block:(WypActionBlock)__action {
    UIButton *__button = [UIButton buttonWithType:UIButtonTypeCustom];
    [__button setBackgroundImage:__image forState:UIControlStateNormal];
    [__button setBackgroundImage:__highImage forState:UIControlStateHighlighted];

    CGRect __frame = __button.frame;
    __frame.size = __button.currentBackgroundImage.size;
    __button.frame = __frame;
    
    [__button wyp_handleEventWithBlock:__action];
    return [[UIBarButtonItem alloc] initWithCustomView:__button];
}
@end
