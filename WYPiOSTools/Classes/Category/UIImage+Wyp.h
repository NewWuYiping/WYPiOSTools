//
//  UIImage+Wyp.h
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Wyp)

+ (UIImage *)wyp_imageWithColor:(UIColor *)_color;
+ (UIImage *)wyp_imageWithHexString:(NSString *)_color;

/**
 * 传入一个size，生成一张新的图片
 */
- (UIImage *)wyp_resizeImage:(CGSize)_size;

/**
 * 根据原图片生成一张拉伸中点的新图片
 */
- (UIImage *)wyp_resizableImage4Center;

/**
 * 根据原图片生成一张拉伸中点的新图片
 */
+ (UIImage *)wyp_resizableImage4Center:(NSString *)__imageName;

+ (UIImage*)wyp_imageFromView:(UIView*)view;


- (void)wyp_save2DocumentWithName:(NSString *)__name;

+ (instancetype)wyp_instanceWithBase64:(NSString *)__base64;
- (NSString *)wyp_convert2Base64;

+ (UIImage *)wyp_imageFromDocumentWithName:(NSString *)__name;

-(UIImage*)wyp_getSubImage:(CGRect)__rect;
-(UIImage*)wyp_scaleToSize:(CGSize)__size;

+(id)wyp_createRoundedRectImage:(UIImage*)image size:(CGSize)size;
@end
