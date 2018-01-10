//
//  UIControl+Wyp.m
//  WypLib
//
//  Created by 邬一平 on 15/4/5.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "UIControl+Wyp.h"
#import <objc/runtime.h>

@interface UIControl ()
- (void)__callActionBlock:(id)sender;
@end

@implementation UIControl (Wyp)

static char overviewKey;
- (void)wyp_handleControlEvent:(UIControlEvents)__event withBlock:(WypActionBlock)__actionBlock {
    objc_setAssociatedObject(self, &overviewKey, __actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(__callActionBlock:) forControlEvents:__event];
}

- (void)wyp_handleEventWithBlock:(WypActionBlock)__action {
    [self wyp_handleControlEvent:UIControlEventTouchUpInside withBlock:__action];
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

@end
