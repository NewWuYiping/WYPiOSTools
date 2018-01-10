//
//  NSNumber+Wyp.h
//  WypLib
//
//  Created by 邬一平 on 15/4/28.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Wyp)
+(NSNumber *)wyp_roundingWithNum:(float)__num afterPoint:(int)__position mode:(NSRoundingMode)__mode;
@end
