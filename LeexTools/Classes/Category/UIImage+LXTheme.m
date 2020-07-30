//
//  UIImage+LXTheme.m
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import "UIImage+LXTheme.h"
#import "LXUtil.h"
@implementation UIImage (LXTheme)
+ (UIImage*)imageWithLightName:(NSString*)lightName darkName:(NSString*)darkName
{
    if ([LXUtil darkColorTheme]) {
        if (![UIImage imageNamed:darkName]) {
            return [UIImage imageNamed:lightName];
        }
        return [UIImage imageNamed:darkName];
    }
    return [UIImage imageNamed:lightName];
}


+ (UIImage*)imageWithLightImg:(UIImage*)lightImg darkImg:(UIImage*)darkImg
{
    if ([LXUtil darkColorTheme]) {
        return darkImg;
    }
    return lightImg;
}
@end
