//
//  Common.h
//  TDMiningMachine
//
//  Created by leex on 2019/6/28.
//  Copyright © 2019 leex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LXUtil : NSObject
#pragma mark -Tools
//倒计时 和颜色
+(void)countDown:(UIButton *)btn time:(int)kcountdown disabledColor:(UIColor*)disabledColor enabledColor:(UIColor*)enabledColor;
//二维码
+(UIImage *)createQRForString:(NSString *)qrString withSize:(CGFloat)size;

//计算宽度
+ (CGFloat)calculateRowWidth:(NSString *)string font:(CGFloat)font height:(CGFloat)height;

//计算高度
+ (CGFloat)calculateRowHeight:(NSString *)string font:(CGFloat)font width:(CGFloat)width;

//获取当前控制器
+ (UIViewController *)jsd_getCurrentViewController;

//对比数组
+ (BOOL)compareArray:(NSArray *)array1 isEqualTo:(NSArray *)array2;

//获取ip
+ (NSString*)getIPaddress;

+ (BOOL)isIphoneX;

//颜色值转换
+ (UIColor*)hexColor:(NSString*)hexColor;

//通过颜色来生成一个纯色图片
+(UIImage *)creatImageFromColor:(UIColor *)color;

//去除空串
+(NSString*)checkNullString:(NSString*)string;



#pragma mark -正则
/**
 *  正则是不是手机号
 */
+(BOOL)isPhoneNumber:(NSString*)phone;
/**
 *  正则是不是邮箱
 */
+(BOOL)isEmail:(NSString*)email;
/**
 *  正则是不是url
 */
+ (BOOL)isValidUrl:(NSString*)url;
/**
 *  字母+数字
 */
+ (BOOL)isNumAndStr:(NSString*)str;
/**
 *  正则是不是数字
 */
+ (BOOL)isValidNumber:(NSString *)inputString;
/**
 *  正则小数不超过几位小数
 */
+ (BOOL)checkNum:(NSString *)str withPoint:(int)point;


#pragma mark-NSUserDefaults
//增，改
+ (void)saveUserDefaults:(id)param forkey:(NSString*)key;
//查
+ (id)getUserDefaultsWithKey:(NSString*)key;
//删
+ (void)removeUserDefaulsWithKey:(NSString*)key;

#pragma mark -DarkTheme
//是否是黑色主题
+ (BOOL)darkColorTheme;

//设置statusbar字体黑色（夜间模式为白色）
+(void)setStatusBarDark;


#pragma mark -处理数字
//科学计数法
+(NSString *)formartScientificNotationWithString:(NSString *)str;

@end


