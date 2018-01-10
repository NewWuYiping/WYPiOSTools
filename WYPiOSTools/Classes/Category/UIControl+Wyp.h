//
//  UIControl+Wyp.h
//  WypLib
//
//  Created by 邬一平 on 15/4/5.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WypBlocks.h"

@interface UIControl (Wyp)

- (void)wyp_handleControlEvent:(UIControlEvents)__event withBlock:(WypActionBlock)__action;
- (void)wyp_handleEventWithBlock:(WypActionBlock)__action;

@end
