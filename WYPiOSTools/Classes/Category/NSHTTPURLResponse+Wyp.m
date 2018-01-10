//
//  NSURLResponse+Wyp.m
//  WypLib
//
//  Created by 吴清正 on 16/7/28.
//  Copyright © 2016年 邬一平. All rights reserved.
//

#import "NSHTTPURLResponse+Wyp.h"

@implementation NSHTTPURLResponse (Wyp)
- (void)wyp_statusCode:(StatusCodeBlock)__statusCodeBlock{
    NSLog(@"self.statusCode:%ld",self.statusCode);
    __statusCodeBlock(self.statusCode);
}

@end
