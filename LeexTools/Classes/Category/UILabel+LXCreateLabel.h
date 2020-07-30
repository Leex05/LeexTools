//
//  UILabel+LXCreateLabel.h
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LXCreateLabel)
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color;
    
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text;

+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color
                      text:(NSString *)text;

+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color;


/**
 设置文本,并指定行间距
 
 @param text 文本内容
 @param lineSpacing 行间距
 */
-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;

@end
