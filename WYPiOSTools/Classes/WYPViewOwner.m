//
//  WYPViewHolder.m
//  CloudContract
//
//  Created by 邬一平 on 2017/6/9.
//  Copyright © 2017年 邬一平. All rights reserved.
//

#import "WYPViewOwner.h"

@implementation WYPViewOwner

- (instancetype)init {
    self = [super init];
    if(self == nil){
        return nil;
    }
    self.currentBundle = [NSBundle mainBundle];
    return self;
}

- (UIView *)wyp_viewFromNibNamed:(NSString*)nibName {
    [self.currentBundle loadNibNamed:nibName owner:self options:nil];
    return self.view;
}
@end

@implementation UIView (WYPViewOwner)

+ (instancetype)wyp_loadFromNibNamed:(NSString*) nibName bundle:(NSBundle *)bundle {
    WYPViewOwner *owner = [[WYPViewOwner alloc] init];
    owner.currentBundle = bundle;
    return [owner wyp_viewFromNibNamed:nibName];
}

+ (instancetype)wyp_loadFromNib4Owner {
    return [self wyp_loadFromNibNamed:NSStringFromClass(self)];
}

+ (instancetype)wyp_loadFromNib {
    UIView *result = nil;
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed: NSStringFromClass([self class]) owner: nil options: nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            result = anObject;
            break;
        }
    }
    return result;
}
@end
