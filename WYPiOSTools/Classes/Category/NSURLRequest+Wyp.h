//
//  NSURLRequest+Wyp.h
//  WypLib
//
//  Created by 邬一平 on 16/3/21.
//  Copyright © 2016年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (Wyp)

- (NSURLRequest *)wyp_requestWithHeaderFields:(NSDictionary<NSString *, NSString*> *)__headerFields;
@end
