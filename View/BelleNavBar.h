//
//  BelleNavBar.h
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BelleNavBar : UINavigationBar

/**
    设置全局的导航栏背景图片
    globalImg 全局的导航栏背景图片
 */
+ (void)setGlobalBackgroundImage: (UIImage *)globalImg;

/**
    设置全局的导航栏的标题颜色、文字大小
    globalTextColor 全局的导航栏背景图片
    fontSize 全局导航栏的文字大小
 */
+ (void)setGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize;

@end
