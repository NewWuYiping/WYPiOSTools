//
//  NSObject+Wyp.h
//
//  Created by 邬一平 on 14-9-23.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GenderType) {//用户类型
    GenderType_woman                   = 0,//女人
    GenderType_man                    = 1,//男人
};
@interface NSObject (Wyp)

/**
 * 拷贝一个类的属性值给到另外一个类的属性值，有相同的属性则赋值，没有则忽略
 */
-(void)wyp_easyShallowCopy:(NSObject *)__object;

/**
 * 拷贝一个类的属性值给到另外一个类的属性值，有相同的属性则赋值，没有则忽略
 */
-(void)wyp_easyDeepCopy:(NSObject *)__object;

- (NSString  *)wyp_className;
@end
