//
//  BelleTabBar.h
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BelleTabBar : UITabBar

/**
 点击中间的按钮执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end
