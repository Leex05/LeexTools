//
//  UILabel+LXCreateLabel.m
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import "UILabel+LXCreateLabel.h"

@implementation UILabel (LXCreateLabel)
+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color{

    return [self labelWithFrame:frame font:font color:color text:nil];
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text{
    UILabel *label = [UILabel new];
    label.frame = frame;
    label.font = font;
    label.text = text;
    label.textColor = color;
    return label;
}

+ (UILabel *)labelWithFont:(UIFont *)font
                      color:(UIColor *)color
                       text:(NSString *)text{
    return [self labelWithFrame:CGRectZero font:font color:color text:text];
}

+ (UILabel *)labelWithFont:(UIFont *)font
                     color:(UIColor *)color
{
    return [self labelWithFrame:CGRectZero font:font color:color text:@""];
}

-(void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text || lineSpacing < 0.01) {
        self.text = text;
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
}
@end
