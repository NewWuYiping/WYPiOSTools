//
//  UIColor+Wyp.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "UIColor+Wyp.h"
#import "NSString+Wyp.h"
#import "WypDeviceTools.h"

@interface UIColor ()



@end

@implementation UIColor (Wyp)

+ (UIColor *)wyp_colorWithHexString:(NSString *)__hex alpha:(CGFloat)__alpha {
    
    NSString *cString = [[__hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:__alpha];
}

+ (UIColor *)wyp_colorWithHexString:(NSString *)__hex {
    return [UIColor wyp_colorWithHexString:__hex alpha:1.0f];
}

+ (UIColor *)wyp_colorWithHex:(NSInteger)__hex alpha:(CGFloat)__alpha {
    return [UIColor colorWithRed:((float)((__hex & 0xFF0000) >> 16))/255.0
                           green:((float)((__hex & 0xFF00) >> 8))/255.0
                            blue:((float)(__hex & 0xFF))/255.0 alpha:__alpha];
}

+ (UIColor *)wyp_colorWithHex:(NSInteger)__hex {
    return [UIColor wyp_colorWithHex:__hex alpha:1.0];
}

/**
 * 得到一个随机颜色
 */
+ (UIColor *)wyp_randomColor {
    static BOOL seed = NO;
    if (!seed) {
        seed = YES;
        srandom((unsigned int)time(NULL));
    }
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}



- (NSString *)wyp_logColor {
    @try {
        const CGFloat *__components = CGColorGetComponents(self.CGColor);
        int __r = __components[0] * 255;
        int __g = __components[1] * 255;
        int __b = __components[2] * 255;
        NSString *__returnStr = [NSString stringWithFormat:@"#%x%x%x", __r, __g, __b];
        WypLog(@"ALPHA=%.2f, RGB=%@",__components[3], __returnStr);
        return __returnStr;
    }@catch (NSException *exception) {
        WypLog(@"xxxxxxxxxxxx 该颜色不属于RGB颜色空间 xxxxxxxxxxxx");
    }
    return nil;
}

+ (UIColor *)wyp_colorWithAlpha:(CGFloat)__alpha color:(UIColor *)__color {
    NSString *__colorStr = [__color wyp_logColor];
    if ([NSString wyp_isEmpty:__colorStr]) {
        return nil;
    }
    return [UIColor wyp_colorWithHexString:__colorStr alpha:__alpha];
}

- (NSString *)toHex:(int)tmpid {
    NSString *endtmp = @"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig = tmpid % 16;
    int tmp = tmpid / 16;
    switch (ttmpig) {
        case 10:
            nLetterValue = @"A"; break;
        case 11:
            nLetterValue = @"B"; break;
        case 12:
            nLetterValue = @"C"; break;
        case 13:
            nLetterValue = @"D"; break;
        case 14:
            nLetterValue = @"E"; break;
        case 15:
            nLetterValue = @"F"; break;
        default:
            nLetterValue = [NSString stringWithFormat:@"%i", ttmpig];
    }
    switch (tmp) {
        case 10:
            nStrat = @"A";
            break;
        case 11:
            nStrat = @"B";
            break;
        case 12:
            nStrat = @"C";
            break;
        case 13:
            nStrat = @"D";
            break;
        case 14:
            nStrat = @"E";
            break;
        case 15:
            nStrat = @"F";
            break;
        default:
            nStrat = [NSString stringWithFormat:@"%i", tmp];
    }
    endtmp = [NSString stringWithFormat:@"%@%@", nStrat, nLetterValue];
    return endtmp;
}

- (NSString *)wyp_htmlRGB {
    const CGFloat *cs = CGColorGetComponents(self.CGColor);
    
    NSString *r = [NSString stringWithFormat:@"%@", [self toHex:cs[0] * 255]];
    NSString *g = [NSString stringWithFormat:@"%@", [self toHex:cs[1] * 255]];
    NSString *b = [NSString stringWithFormat:@"%@", [self toHex:cs[2] * 255]];
    
    NSString *t = [NSString stringWithFormat:@"#%@%@%@", r, g, b];
    return t;
}

#pragma mark - System Colors
+ (instancetype)infoBlueColor
{
    return [[self class] colorWithR:47 G:112 B:225 A:1.0];
}

+ (instancetype)successColor
{
    return [[self class] colorWithR:83 G:215 B:106 A:1.0];
}

+ (instancetype)warningColor
{
    return [[self class] colorWithR:221 G:170 B:59 A:1.0];
}

+ (instancetype)dangerColor
{
    return [[self class] colorWithR:229 G:0 B:15 A:1.0];
}

#pragma mark - Whites
+ (instancetype)antiqueWhiteColor
{
    return [[self class] colorWithR:250 G:235 B:215 A:1.0];
}

+ (instancetype)oldLaceColor
{
    return [[self class] colorWithR:253 G:245 B:230 A:1.0];
}

+ (instancetype)ivoryColor
{
    return [[self class] colorWithR:255 G:255 B:240 A:1.0];
}

+ (instancetype)seashellColor
{
    return [[self class] colorWithR:255 G:245 B:238 A:1.0];
}

+ (instancetype)ghostWhiteColor
{
    return [[self class] colorWithR:248 G:248 B:255 A:1.0];
}

+ (instancetype)snowColor
{
    return [[self class] colorWithR:255 G:250 B:250 A:1.0];
}

+ (instancetype)linenColor
{
    return [[self class] colorWithR:250 G:240 B:230 A:1.0];
}


#pragma mark - Grays
+ (instancetype)black25PercentColor
{
    return [[self class] colorWithWhite:0.25 alpha:1.0];
}

+ (instancetype)black50PercentColor
{
    return [[self class] colorWithWhite:0.5  alpha:1.0];
}

+ (instancetype)black75PercentColor
{
    return [[self class] colorWithWhite:0.75 alpha:1.0];
}

+ (instancetype)warmGrayColor
{
    return [[self class] colorWithR:133 G:117 B:112 A:1.0];
}

+ (instancetype)coolGrayColor
{
    return [[self class] colorWithR:118 G:122 B:133 A:1.0];
}

+ (instancetype)charcoalColor
{
    return [[self class] colorWithR:34 G:34 B:34 A:1.0];
}


#pragma mark - Blues
+ (instancetype)tealColor
{
    return [[self class] colorWithR:28 G:160 B:170 A:1.0];
}

+ (instancetype)steelBlueColor
{
    return [[self class] colorWithR:103 G:153 B:170 A:1.0];
}

+ (instancetype)robinEggColor
{
    return [[self class] colorWithR:141 G:218 B:247 A:1.0];
}

+ (instancetype)pastelBlueColor
{
    return [[self class] colorWithR:99 G:161 B:247 A:1.0];
}

+ (instancetype)turquoiseColor
{
    return [[self class] colorWithR:112 G:219 B:219 A:1.0];
}

+ (instancetype)skyBlueColor
{
    return [[self class] colorWithR:0 G:178 B:238 A:1.0];
}

+ (instancetype)indigoColor
{
    return [[self class] colorWithR:13 G:79 B:139 A:1.0];
}

+ (instancetype)denimColor
{
    return [[self class] colorWithR:67 G:114 B:170 A:1.0];
}

+ (instancetype)blueberryColor
{
    return [[self class] colorWithR:89 G:113 B:173 A:1.0];
}

+ (instancetype)cornflowerColor
{
    return [[self class] colorWithR:100 G:149 B:237 A:1.0];
}

+ (instancetype)babyBlueColor
{
    return [[self class] colorWithR:190 G:220 B:230 A:1.0];
}

+ (instancetype)midnightBlueColor
{
    return [[self class] colorWithR:13 G:26 B:35 A:1.0];
}

+ (instancetype)fadedBlueColor
{
    return [[self class] colorWithR:23 G:137 B:155 A:1.0];
}

+ (instancetype)icebergColor
{
    return [[self class] colorWithR:200 G:213 B:219 A:1.0];
}

+ (instancetype)waveColor
{
    return [[self class] colorWithR:102 G:169 B:251 A:1.0];
}


#pragma mark - Greens
+ (instancetype)emeraldColor
{
    return [[self class] colorWithR:1 G:152 B:117 A:1.0];
}

+ (instancetype)grassColor
{
    return [[self class] colorWithR:99 G:214 B:74 A:1.0];
}

+ (instancetype)pastelGreenColor
{
    return [[self class] colorWithR:126 G:242 B:124 A:1.0];
}

+ (instancetype)seafoamColor
{
    return [[self class] colorWithR:77 G:226 B:140 A:1.0];
}

+ (instancetype)paleGreenColor
{
    return [[self class] colorWithR:176 G:226 B:172 A:1.0];
}

+ (instancetype)cactusGreenColor
{
    return [[self class] colorWithR:99 G:111 B:87 A:1.0];
}

+ (instancetype)chartreuseColor
{
    return [[self class] colorWithR:69 G:139 B:0 A:1.0];
}

+ (instancetype)hollyGreenColor
{
    return [[self class] colorWithR:32 G:87 B:14 A:1.0];
}

+ (instancetype)oliveColor
{
    return [[self class] colorWithR:91 G:114 B:34 A:1.0];
}

+ (instancetype)oliveDrabColor
{
    return [[self class] colorWithR:107 G:142 B:35 A:1.0];
}

+ (instancetype)moneyGreenColor
{
    return [[self class] colorWithR:134 G:198 B:124 A:1.0];
}

+ (instancetype)honeydewColor
{
    return [[self class] colorWithR:216 G:255 B:231 A:1.0];
}

+ (instancetype)limeColor
{
    return [[self class] colorWithR:56 G:237 B:56 A:1.0];
}

+ (instancetype)cardTableColor
{
    return [[self class] colorWithR:87 G:121 B:107 A:1.0];
}


#pragma mark - Reds
+ (instancetype)salmonColor
{
    return [[self class] colorWithR:233 G:87 B:95 A:1.0];
}

+ (instancetype)brickRedColor
{
    return [[self class] colorWithR:151 G:27 B:16 A:1.0];
}

+ (instancetype)easterPinkColor
{
    return [[self class] colorWithR:241 G:167 B:162 A:1.0];
}

+ (instancetype)grapefruitColor
{
    return [[self class] colorWithR:228 G:31 B:54 A:1.0];
}

+ (instancetype)pinkColor
{
    return [[self class] colorWithR:255 G:95 B:154 A:1.0];
}

+ (instancetype)indianRedColor
{
    return [[self class] colorWithR:205 G:92 B:92 A:1.0];
}

+ (instancetype)strawberryColor
{
    return [[self class] colorWithR:190 G:38 B:37 A:1.0];
}

+ (instancetype)coralColor
{
    return [[self class] colorWithR:240 G:128 B:128 A:1.0];
}

+ (instancetype)maroonColor
{
    return [[self class] colorWithR:80 G:4 B:28 A:1.0];
}

+ (instancetype)watermelonColor
{
    return [[self class] colorWithR:242 G:71 B:63 A:1.0];
}

+ (instancetype)tomatoColor
{
    return [[self class] colorWithR:255 G:99 B:71 A:1.0];
}

+ (instancetype)pinkLipstickColor
{
    return [[self class] colorWithR:255 G:105 B:180 A:1.0];
}

+ (instancetype)paleRoseColor
{
    return [[self class] colorWithR:255 G:228 B:225 A:1.0];
}

+ (instancetype)crimsonColor
{
    return [[self class] colorWithR:187 G:18 B:36 A:1.0];
}


#pragma mark - Purples
+ (instancetype)eggplantColor
{
    return [[self class] colorWithR:105 G:5 B:98 A:1.0];
}

+ (instancetype)pastelPurpleColor
{
    return [[self class] colorWithR:207 G:100 B:235 A:1.0];
}

+ (instancetype)palePurpleColor
{
    return [[self class] colorWithR:229 G:180 B:235 A:1.0];
}

+ (instancetype)coolPurpleColor
{
    return [[self class] colorWithR:140 G:93 B:228 A:1.0];
}

+ (instancetype)violetColor
{
    return [[self class] colorWithR:191 G:95 B:255 A:1.0];
}

+ (instancetype)plumColor
{
    return [[self class] colorWithR:139 G:102 B:139 A:1.0];
}

+ (instancetype)lavenderColor
{
    return [[self class] colorWithR:204 G:153 B:204 A:1.0];
}

+ (instancetype)raspberryColor
{
    return [[self class] colorWithR:135 G:38 B:87 A:1.0];
}

+ (instancetype)fuschiaColor
{
    return [[self class] colorWithR:255 G:20 B:147 A:1.0];
}

+ (instancetype)grapeColor
{
    return [[self class] colorWithR:54 G:11 B:88 A:1.0];
}

+ (instancetype)periwinkleColor
{
    return [[self class] colorWithR:135 G:159 B:237 A:1.0];
}

+ (instancetype)orchidColor
{
    return [[self class] colorWithR:218 G:112 B:214 A:1.0];
}


#pragma mark - Yellows
+ (instancetype)goldenrodColor
{
    return [[self class] colorWithR:215 G:170 B:51 A:1.0];
}

+ (instancetype)yellowGreenColor
{
    return [[self class] colorWithR:192 G:242 B:39 A:1.0];
}

+ (instancetype)bananaColor
{
    return [[self class] colorWithR:229 G:227 B:58 A:1.0];
}

+ (instancetype)mustardColor
{
    return [[self class] colorWithR:205 G:171 B:45 A:1.0];
}

+ (instancetype)buttermilkColor
{
    return [[self class] colorWithR:254 G:241 B:181 A:1.0];
}

+ (instancetype)goldColor
{
    return [[self class] colorWithR:139 G:117 B:18 A:1.0];
}

+ (instancetype)creamColor
{
    return [[self class] colorWithR:240 G:226 B:187 A:1.0];
}

+ (instancetype)lightCreamColor
{
    return [[self class] colorWithR:240 G:238 B:215 A:1.0];
}

+ (instancetype)wheatColor
{
    return [[self class] colorWithR:240 G:238 B:215 A:1.0];
}

+ (instancetype)beigeColor
{
    return [[self class] colorWithR:245 G:245 B:220 A:1.0];
}


#pragma mark - Oranges
+ (instancetype)peachColor
{
    return [[self class] colorWithR:242 G:187 B:97 A:1.0];
}

+ (instancetype)burntOrangeColor
{
    return [[self class] colorWithR:184 G:102 B:37 A:1.0];
}

+ (instancetype)pastelOrangeColor
{
    return [[self class] colorWithR:248 G:197 B:143 A:1.0];
}

+ (instancetype)cantaloupeColor
{
    return [[self class] colorWithR:250 G:154 B:79 A:1.0];
}

+ (instancetype)carrotColor
{
    return [[self class] colorWithR:237 G:145 B:33 A:1.0];
}

+ (instancetype)mandarinColor
{
    return [[self class] colorWithR:247 G:145 B:55 A:1.0];
}


#pragma mark - Browns
+ (instancetype)chiliPowderColor
{
    return [[self class] colorWithR:199 G:63 B:23 A:1.0];
}

+ (instancetype)burntSiennaColor
{
    return [[self class] colorWithR:138 G:54 B:15 A:1.0];
}

+ (instancetype)chocolateColor
{
    return [[self class] colorWithR:94 G:38 B:5 A:1.0];
}

+ (instancetype)coffeeColor
{
    return [[self class] colorWithR:141 G:60 B:15 A:1.0];
}

+ (instancetype)cinnamonColor
{
    return [[self class] colorWithR:123 G:63 B:9 A:1.0];
}

+ (instancetype)almondColor
{
    return [[self class] colorWithR:196 G:142 B:72 A:1.0];
}

+ (instancetype)eggshellColor
{
    return [[self class] colorWithR:252 G:230 B:201 A:1.0];
}

+ (instancetype)sandColor
{
    return [[self class] colorWithR:222 G:182 B:151 A:1.0];
}

+ (instancetype)mudColor
{
    return [[self class] colorWithR:70 G:45 B:29 A:1.0];
}

+ (instancetype)siennaColor
{
    return [[self class] colorWithR:160 G:82 B:45 A:1.0];
}

+ (instancetype)dustColor
{
    return [[self class] colorWithR:236 G:214 B:197 A:1.0];
}

#pragma mark - RGBA Helper method
+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
    return [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
