//
//  WypTableViewCell.m
//
//  Created by 邬一平 on 14-9-25.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypTableViewCell.h"
#import "WypDeviceTools.h"

@implementation WypTableViewCell



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([WypDeviceTools wyp_iosVersion] >= 7) {
        for (UIView *subview in self.contentView.superview.subviews) {
            @try {
                if ([NSStringFromClass(subview.class) hasSuffix:@"SeparatorView"]) {
                    subview.hidden = NO;
                }
            }@catch (NSException *exception) {
                WypLog(@"%s, %@", __FUNCTION__, exception);
            }
            
        }
    }
}

@end
