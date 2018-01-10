//
//  UIActionSheet+Wyp.h
//  纳税服务
//
//  Created by 邬一平 on 14-10-7.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAlertView+Wyp.h"

typedef void(^UIActionSheetBlock)(NSInteger __btnIndex);

@interface UIActionSheet (Wyp)<UIActionSheetDelegate>

- (void)showInView:(UIView *)__view withBlock:(UIActionSheetBlock) __actionBlock;
- (void)wyp_showInView:(UIView *)__view withBlock:(UIActionSheetBlock) __actionBlock;
@end
