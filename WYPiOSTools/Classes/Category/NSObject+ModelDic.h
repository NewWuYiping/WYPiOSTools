//
//  NSObject+ModelDic.h
//  WypLib
//
//  Created by 邬一平 on 15/4/30.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(ModelDic)

/**
 * 把对象（Model）转换成字典
 */
+ (NSDictionary *)wyp_model2Dic:(id)model;

/*
 * 获取Model的所有属性名称
 */
+ (NSArray *)wyp_properties4Model:(id)model;

/*
 * 把字典转换成模型，模型类名为className
 */
+ (id)wyp_modelWithDict:(NSDictionary *)dict className:(NSString *)className;
@end
