//
//  UIActionSheet+Wyp.m
//  纳税服务
//
//  Created by 邬一平 on 14-10-7.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import "UIActionSheet+Wyp.h"
#import <objc/runtime.h>


@implementation UIActionSheet (Wyp)

static char key;
- (void)showInView:(UIView *)__view withBlock:(UIActionSheetBlock) __actionBlock {
    if (__actionBlock) {
        objc_removeAssociatedObjects(self);
        objc_setAssociatedObject(self, &key, __actionBlock, OBJC_ASSOCIATION_COPY);
        self.delegate = self;
    }
    [self showInView:__view];
}

- (void)wyp_showInView:(UIView *)__view withBlock:(UIActionSheetBlock) __actionBlock {
    [self showInView:__view withBlock:__actionBlock];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex; {
    UIAlertViewBlock block = objc_getAssociatedObject(self, &key);
    if (block) {
        block(buttonIndex);
    }
}
@end
