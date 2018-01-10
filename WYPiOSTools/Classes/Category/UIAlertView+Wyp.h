//
//  UIAlertView+Wyp.h
//
//  Created by 邬一平 on 14-9-14.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewBlock)(NSInteger __btnIndex);
@interface UIAlertView (Wyp)


- (void)showAlertViewWithBlock:(UIAlertViewBlock) aBlock;
- (void)wyp_showAlertViewWithBlock:(UIAlertViewBlock) aBlock;
@end
