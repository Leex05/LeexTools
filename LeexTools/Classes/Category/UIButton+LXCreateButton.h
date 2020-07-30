//
//  UIButton+LXCreateButton.h
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LXCreateButton)
+ (UIButton *)buttonWithFont:(UIFont *)font
                     color:(UIColor *)color
                        text:(NSString *)text;

+ (UIButton *)buttonWithFont:(UIFont *)font
                       color:(UIColor *)color backgroundColor:(UIColor*)color
                        text:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
