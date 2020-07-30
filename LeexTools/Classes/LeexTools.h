//
//  LeexTools.h
//  LeexTools
//
//  Created by leex on 2020/7/30.
//  Copyright © 2020 leex_ios@163.com. All rights reserved.
//

#ifndef LeexTools_h
#define LeexTools_h

#import "LXUtil.h"
#import <LeexTools/UIButton+LXCreateButton.h>
#import <LeexTools/UILabel+LXCreateLabel.h>
#import <LeexTools/UIImage+LXTheme.h>
#import <LeexTools/UIView+LXFrame.h>
#import <LeexTools/NSString+LXMath.h>
#import <LeexTools/LXNetWork.h>
#import <LeexTools/LXNetworkCache.h>

/*******
 机型
*******/
#define IS_IPHONE_X ([[UIApplication sharedApplication] statusBarFrame].size.height>20 ? YES: NO)

/*******
 屏幕
 *******/
#define LXSCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define LXSCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define LXRealValue(value) ((value)*(LXSCREEN_WIDTH / 375.0))


/*******
 状态栏,导航栏，tabbar高度
 *******/
#define LXStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define LXNavBarHeight 44.0
#define LXTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define LXTopHeight (LXStatusBarHeight + LXNavBarHeight)
#define LXBottomBarHeight (IS_IPHONE_X ? 34.0f:0.0f)

/*******
 图片（含黑夜模式）
 *******/
#define UIIMAGE(imageName) [UIImage imageWithLightName:imageName darkName:[NSString stringWithFormat:@"%@_dark",imageName]]

#endif /* LeexTools_h */
