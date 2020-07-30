//
//  UIImage+LXTheme.h
//  LeexTools_Example
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LXTheme)
+ (UIImage*)imageWithLightName:(NSString*)lightName darkName:(NSString*)darkName;

+ (UIImage*)imageWithLightImg:(UIImage*)lightImg darkImg:(UIImage*)darkImg;
@end

NS_ASSUME_NONNULL_END
