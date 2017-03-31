//
//  CALayer+PauseAimate.h
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (PauseAimate)
//暂停动画
- (void)pauseAnimate;

//开始动画
- (void)resumeAnimate;

@end
