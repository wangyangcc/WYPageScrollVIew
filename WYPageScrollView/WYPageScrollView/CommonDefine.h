//
//  CommonDefine.h
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/18.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#ifndef WYPageScrollView_CommonDefine_h
#define WYPageScrollView_CommonDefine_h

#define IOS7AFTER  ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0)
#define MMRGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define ScreenHeight  (IOS7AFTER ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.height - 20)
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define MMStatusBarHeight (IOS7AFTER ? CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) : CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) - 20)
#define MMNavigationBarHeight (44 + 20)

#endif
