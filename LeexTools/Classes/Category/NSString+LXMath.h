//
//  NSString+LXMath.h
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LXMath)
//去零
+ (NSString *)deletingZeroWithStringValue:(NSString *)value keepDigit:(NSInteger)digit mode:(NSRoundingMode)mode;

+ (NSString *)deletingZeroWithDoubleValue:(double)value keepDigit:(NSInteger)digit mode:(NSRoundingMode)mode;

//补零
+ (NSString *)interceptDecimalPoint:(NSString *)string bit:(NSInteger)bitNum;
@end

NS_ASSUME_NONNULL_END
