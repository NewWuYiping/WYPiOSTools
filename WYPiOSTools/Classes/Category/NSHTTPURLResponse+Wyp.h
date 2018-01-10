//
//  NSURLResponse+Wyp.h
//  WypLib
//
//  Created by 吴清正 on 16/7/28.
//  Copyright © 2016年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^StatusCodeBlock)(NSInteger __statusCode);

@interface NSHTTPURLResponse (Wyp)

- (void)wyp_statusCode:(StatusCodeBlock)__statusCodeBlock;
@end
