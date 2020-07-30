//
//  NSString+LXMath.m
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import "NSString+LXMath.h"

@implementation NSString (LXMath)
+ (NSString *)deletingZeroWithStringValue:(NSString *)value keepDigit:(NSInteger)digit mode:(NSRoundingMode)mode{
    NSString *valueStr;
    CGFloat copyValue = value.doubleValue;
    if (copyValue < 0) {
        copyValue *= -1;
    }
    NSDecimalNumberHandler *handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:mode scale:digit raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    valueStr = copyValue < 0 ? [NSString stringWithFormat:@"-%@",handler] : [NSString stringWithFormat:@"%@",handler];
    return valueStr;
}

+ (NSString *)deletingZeroWithDoubleValue:(double)value keepDigit:(NSInteger)digit mode:(NSRoundingMode)mode{
    NSString *valueStr;
    CGFloat copyValue = value;
    if (copyValue < 0) {
        copyValue *= -1;
    }
    NSDecimalNumberHandler *handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:mode scale:digit raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    valueStr = copyValue < 0 ? [NSString stringWithFormat:@"-%@",handler] : [NSString stringWithFormat:@"%@",handler];
    return valueStr;
}

+ (NSString *)interceptDecimalPoint:(NSString *)string bit:(NSInteger)bitNum{
    NSString *returnStr = string;
    if ([returnStr isEqualToString:@"--"]) {
        return returnStr;
    }
    //判断是否包含小数点
    if ([string containsString:@"."]) {
        //截取字符串
        NSArray *bits = [string componentsSeparatedByString:@"."];
        //如果bits数量大于2说明小数点不止一个
        if (bits.count == 2) {
            NSString *integerStr = [bits firstObject];
            
            NSString *bit = [bits lastObject];
            NSString *newBit = bit;
            if (bit.length >= bitNum) {
                newBit = [bit substringToIndex:bitNum];
            }else{
                for (NSInteger i = bit.length; i < bitNum; i ++) {
                    newBit = [newBit stringByAppendingString:@"0"];
                }
            }
            string = [NSString stringWithFormat:@"%@.%@",integerStr,newBit];
        }
    }else{
        string = [string stringByAppendingString:@"."];
        for (int i = 0; i < bitNum; i ++) {
            string = [string stringByAppendingString:@"0"];
        }
    }
    returnStr = string;
    return returnStr;
}
@end
