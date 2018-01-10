//
//  WypRandomTools.h
//
//  Created by 邬一平 on 14-9-19.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef struct _WypRange {
    NSInteger from;
    NSInteger to;
} WypRange;


NS_INLINE WypRange WypMakeRange(NSInteger __from, NSInteger __to) {
    WypRange r;
    r.from = __from;
    r.to = __to;
    return r;
}
/**
 *1、获取一个随机整数范围在：[0,100)包括0，不包括100
 
 int x = arc4random() % 100;
 
 2、  获取一个随机数范围在：[500,1000），包括500，不包括1000
 
 int y = (arc4random() % 501) + 500;
 
 3、获取一个随机整数，范围在[from,to），包括from，不包括to
 
 -(int)getRandomNumber:(int)from to:(int)to
 
 {
 
 return (int)(from + (arc4random() % (to – from + 1)));
 
 }
 **/
@interface WypRandomTools : NSObject

+ (NSInteger)randomInt4Size:(NSInteger)__size;

+ (NSInteger)randomInt4Range:(WypRange)__range;

@end
