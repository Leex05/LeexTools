//
//  Common.m
//  TDMiningMachine
//
//  Created by leex on 2019/6/28.
//  Copyright © 2019 leex. All rights reserved.
//
#import "LXUtil.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation LXUtil
#pragma mark -Tools
+(void)countDown:(UIButton *)btn time:(int)kcountdown disabledColor:(UIColor*)disabledColor enabledColor:(UIColor*)enabledColor{
    __block int countdown;
    NSString *title = btn.titleLabel.text;
    [btn setEnabled:NO];
    [btn setTitleColor:disabledColor forState:UIControlStateNormal];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [btn setEnabled:NO];
            countdown=kcountdown;
            
        });
        
        while (countdown>0) {
            
            if (--countdown>0) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [btn setTitle:[NSString stringWithFormat:@"%d S",countdown] forState:UIControlStateNormal];
                });
                [NSThread sleepForTimeInterval:1.0f];
            }
            else
            {
                dispatch_sync(dispatch_get_main_queue(),^{
                    [btn setTitle:title forState:UIControlStateNormal];
                    [btn setTitleColor:enabledColor forState:UIControlStateNormal];
                    [btn setEnabled:YES];
                });
                
            }
        }
    });
}

+(UIImage *)createQRForString:(NSString *)qrString withSize:(CGFloat)size{
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容和纠错级别
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"L" forKey:@"inputCorrectionLevel"];
    // 返回CIImage
    CIImage *image = qrFilter.outputImage;
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //水印图
    UIImage *waterimage = [UIImage imageNamed:@""];
    [waterimage drawInRect:CGRectMake((size-waterimage.size.width)/2.0, (size-waterimage.size.height)/2.0, waterimage.size.width, waterimage.size.height)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

+ (CGFloat)calculateRowWidth:(NSString *)string font:(CGFloat)font height:(CGFloat)height{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, height)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

+ (CGFloat)calculateRowHeight:(NSString *)string font:(CGFloat)font width:(CGFloat)width{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}

+ (UIViewController *)jsd_getCurrentViewController{
    
    UIViewController* currentViewController = [self jsd_getRootViewController];
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                
                currentViewController = currentViewController.childViewControllers.lastObject;
                
                return currentViewController;
            } else {    
                return currentViewController;
            }
        }
        
    }
    return currentViewController;
}

+ (UIViewController *)jsd_getRootViewController{
    
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}


+ (BOOL)compareArray:(NSArray *)array1 isEqualTo:(NSArray *)array2 {
    if (array1.count != array2.count) {
        return NO;
    }
    for (NSString *str in array1) {
        if (![array2 containsObject:str]) {
            return NO;
        }
    }
    return YES;
}

+ (NSString*)getIPaddress
{
    NSString *address = @"error";
    struct ifaddrs * ifaddress = NULL;
    struct ifaddrs * temp_address = NULL;
    int success = 0;
    success = getifaddrs(&ifaddress);
    if(success == 0) {
        temp_address = ifaddress;
        while(temp_address != NULL) {
            if(temp_address->ifa_addr->sa_family == AF_INET) {
              if([[NSString stringWithUTF8String:temp_address->ifa_name] isEqualToString:@"en0"]) {
         address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_address->ifa_addr)->sin_addr)];
                }
            }
            temp_address = temp_address->ifa_next;
        }
    }
    return address;
}

+ (BOOL)isIphoneX
{
    if (@available(iOS 11.0, *)) {
        if ([UIApplication sharedApplication].keyWindow.safeAreaInsets.left>0||[UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom>0) {
            return YES;
        }else
        {
            return NO;
        }

    } else {
        return NO;
    }
}

//颜色值转换
+ (UIColor*)hexColor:(NSString*)hexColor{
    
    unsigned int red, green, blue, alpha;
    NSRange range;
    range.length = 2;
    @try {
        if ([hexColor hasPrefix:@"#"]) {
            hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
        
        if ([hexColor length] > 6) {
            range.location = 6;
            [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&alpha];
        }
    }
    @catch (NSException * e) {
        //        [MAUIToolkit showMessage:[NSString stringWithFormat:@"颜色取值错误:%@,%@", [e name], [e reason]]];
        //        return [UIColor blackColor];
    }
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(1.0f)];
}

//通过颜色来生成一个纯色图片
+(UIImage *)creatImageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 10, 10);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}

//去除空串
+(NSString*)checkNullString:(NSString*)string{
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }else{
        if ([string isEqualToString:@"<null>"]) {
            return @"";
        }else if (!string){
            return @"";
        }else{
            return string;
        }
    }
}

#pragma mark -正则
/**
 *  正则是不是手机号
 */
+(BOOL)isPhoneNumber:(NSString*)phone{
    if (phone.length != 11)
    {
        return NO;
    }else{
        NSString *pattern =@"^1+[3456789]+\\d{9}";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
        BOOL isMatch = [predicate evaluateWithObject:phone];
        if (isMatch) {
            return YES;
        }else{
            return NO;
        }
    }
     
}
/**
 *  正则是不是邮箱
 */
+(BOOL)isEmail:(NSString*)email{
    
    NSString *pattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [predicate evaluateWithObject:email];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
    
}
/**
 *  正则是不是url
 */
+ (BOOL)isValidUrl:(NSString*)url{
    NSString *regex =@"[a-zA-z]+://[^\\s]*";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:url];
}
/**
 *  字母+数字
 */
+ (BOOL)isNumAndStr:(NSString*)str{
    NSString *regex = @"\\d{0,}([a-z]{1,}\\d{1,}){1,}[a-z]{0,}";
        regex = @"((?=.*\\d)(?=.*[a-zA-Z]))[\\da-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}
/**
 *  正则是不是数字
 */
+ (BOOL)isValidNumber:(NSString *)inputString{
    if (inputString == nil || inputString.length == 0) return NO;
    NSString *regex = @"^[0-9]+([.]{0}|[.]{1}[0-9]+)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}
/**
 *  正则小数不超过几位小数
 */
+ (BOOL)checkNum:(NSString *)str withPoint:(int)point{
    NSString *regex = [NSString stringWithFormat:@"^\\-?([1-9]\\d*|0)(\\.\\d{0,%d})?$",point];
    NSPredicate *predicte = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicte evaluateWithObject:str];
}

#pragma mark-NSUserDefaults
+ (void)saveUserDefaults:(id)param forkey:(NSString*)key
{
    if (!key) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setValue:param forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getUserDefaultsWithKey:(NSString *)key
{
    if (!key) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

+ (void)removeUserDefaulsWithKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark -DarkTheme
+(BOOL)darkColorTheme
{
    return [[LXUtil getUserDefaultsWithKey:@"darkColorTheme"]boolValue];
}

+(void)setStatusBarDark
{
    if ([LXUtil darkColorTheme]) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }else
    {
        if (@available(iOS 13.0, *)) {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
        } else {
            [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        }
    }
}

#pragma mark -处理数字
//科学计数法
+(NSString *)formartScientificNotationWithString:(NSString *)str{
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:str];
    NSString * string = [NSString stringWithFormat:@"%@",number];
    return string;
}
@end
