//
//  UIButton+LXCreateButton.m
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import "UIButton+LXCreateButton.h"

@implementation UIButton (LXCreateButton)
+ (UIButton *)buttonWithFont:(UIFont *)font
                       color:(UIColor *)color
                        text:(NSString *)text
{
    return [UIButton buttonWithFont:font color:color backgroundColor:[UIColor clearColor] text:text];
}

+ (UIButton *)buttonWithFont:(UIFont *)font
                       color:(UIColor *)color backgroundColor:(UIColor*)backgroundColor
                        text:(NSString *)text
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.backgroundColor = backgroundColor;
    btn.titleLabel.font = font;
    return btn;
}
@end
