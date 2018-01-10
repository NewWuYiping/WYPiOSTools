//
//  WypLabel.m
//  纳税服务
//
//  Created by 邬一平 on 14-9-27.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import "WypLabel.h"

@implementation WypLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
