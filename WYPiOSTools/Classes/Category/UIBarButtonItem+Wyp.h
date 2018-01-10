//
//  UIBarButtonItem+Wyp.h
//  纳税服务
//
//  Created by 邬一平 on 14-10-7.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WypBlocks.h"

@interface UIBarButtonItem (Wyp)

- (instancetype)initWithTitle:(NSString *)__title
              style:(UIBarButtonItemStyle)__style
          withBlock:(WypActionBlock)__actionBlock;

+ (instancetype)itemWithImage:(NSString *)__image highImage:(NSString *)__highImage block:(WypActionBlock)__action;
@end
