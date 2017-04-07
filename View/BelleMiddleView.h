//
//  BelleMiddleView.h
//  BelleFM
//
//  Created by 十月 on 17/4/5.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BelleMiddleView : UIView

+ (instancetype)shareInstance;

/*
 快速创建中间视图
 返回中间视图
 */
+ (instancetype)middleView;

/**
 控制是否在正常播放
 */
@property (nonatomic, assign) BOOL isPlaying;

/*
 中间图片
 */
@property (nonatomic, strong) UIImage *middleImg;

/*
 点击中间按钮执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);



@end
