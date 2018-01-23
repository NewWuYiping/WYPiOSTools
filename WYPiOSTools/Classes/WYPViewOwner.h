//
//  WYPViewHolder.h
//  CloudContract
//
//  Created by 邬一平 on 2017/6/9.
//  Copyright © 2017年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYPViewOwner : NSObject

@property (nonatomic, weak) IBOutlet UIView *view;
@property (nonatomic, strong) NSBundle *currentBundle;

- (UIView *)wyp_viewFromNibNamed:(NSString*)nibName;
@end

@interface UIView (WYPViewOwner)

+ (instancetype)wyp_loadFromNibNamed:(NSString*) nibName;
+ (instancetype)wyp_loadFromNibNamed:(NSString*) nibName bundle:(NSBundle *)bundle;

@end
