//
//  UIImage+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "UIImage+Wyp.h"
#import "UIColor+Wyp.h"
#import "WypFileTools.h"
#import "NSData+Wyp.h"

@implementation UIImage (Wyp)

+ (UIImage *)wyp_imageWithColor:(UIColor *)_color {
    CGRect _rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(_rect.size);
    CGContextRef _context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(_context, [_color CGColor]);
    CGContextFillRect(_context, _rect);
    UIImage *_returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _returnImage;
}

+ (UIImage *)wyp_imageWithHexString:(NSString *)_color {
    return [UIImage wyp_imageWithColor:[UIColor wyp_colorWithHexString:_color]];
}

- (UIImage *)wyp_resizeImage:(CGSize)_size {
    UIGraphicsBeginImageContext(_size);
    [self drawInRect: CGRectMake(0, 0, _size.width, _size.height)];
    UIImage *_returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _returnImage;
}

- (UIImage *)wyp_resizableImage4Center {
    CGFloat __v = self.size.height * 0.5;
    CGFloat __h = self.size.width * 0.5;
    UIEdgeInsets __insets = UIEdgeInsetsMake(__v, __h, __v, __h);
    return[self resizableImageWithCapInsets:__insets];
}

+ (UIImage *)wyp_resizableImage4Center:(NSString *)__imageName {
    return [[UIImage imageNamed:__imageName] wyp_resizableImage4Center];
}

+ (UIImage*)wyp_imageFromView:(UIView*)view{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, view.layer.contentsScale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (void)wyp_save2DocumentWithName:(NSString *)__name {
    [WypFileTools wyp_saveFile2Document:UIImagePNGRepresentation(self)
                               withName:__name];
}

+ (UIImage *)wyp_imageFromDocumentWithName:(NSString *)__name {
    NSData *__data = [NSData dataWithContentsOfFile:[WypFileTools wyp_documentsPath:__name]];
    return [UIImage imageWithData:__data];
}

+ (instancetype)wyp_instanceWithBase64:(NSString *)__base64; {
    NSData *__data = [NSData dataFromBase64String:__base64];
    return [UIImage imageWithData:__data];
}

- (NSString *)wyp_convert2Base64 {
    NSData *__data = UIImagePNGRepresentation(self);
    return [__data base64EncodedString];
}

-(UIImage*)wyp_getSubImage:(CGRect)__rect {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, __rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

-(UIImage*)wyp_scaleToSize:(CGSize)__size {
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = __size.height*1.0/height;
    float horizontalRadio = __size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (__size.width - width)/2;
    int yPos = (__size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(__size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw,fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


+ (id) wyp_createRoundedRectImage:(UIImage*)image size:(CGSize)size
{
    // the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace,(CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, 5, 5);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return [UIImage imageWithCGImage:imageMasked];
}
@end
