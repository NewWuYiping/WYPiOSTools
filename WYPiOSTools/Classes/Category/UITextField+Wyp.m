//
//  UITextField+Wyp.m
//
//  Created by 邬一平 on 14-9-18.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "UITextField+Wyp.h"
#import "NSString+Wyp.h"

@implementation UITextField (Wyp)
- (CGSize)wyp_getAutoHeight:(CGSize)__size {
    return [self.text wyp_sizeWithFont:self.font maxSize:__size];
}
@end
