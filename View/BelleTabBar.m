//
//  BelleTabBar.m
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import "BelleTabBar.h"
#import "BelleNavigationController.h"
#import "BelleMiddleView.h"
#import "UIView+BelleLayout.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface BelleTabBar()
@property (nonatomic, weak) BelleMiddleView *middleView;

@end

@implementation BelleTabBar

/***
    懒加载 中间空间
    返回中间空间
 
 */
- (BelleMiddleView *)middleView {
    if (_middleView == nil) {
        BelleMiddleView *middleView = [BelleMiddleView shareInstance];
        [self addSubview:middleView];
        _middleView = middleView;
    }
    return _middleView;
}

//初始化设置
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {
    //设置样式，去掉tabBar上的黑线
    self.barStyle = UIBarStyleBlack;
    
    //设置tabBar 背景图片
    self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
//    self.backgroundColor = [UIColor redColor];
    //添加一个按钮 放到中间
    CGFloat width = 65;
    CGFloat height = 65;
    self.middleView.frame = CGRectMake((kScreenWidth - width) * 0.5, (kScreenHeight - height), width, height);
}

- (void)setMiddleClickBlock:(void (^)(BOOL))middleClickBlock {
    self.middleView.middleClickBlock = middleClickBlock;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSInteger count = self.items.count;
    
    //遍历所有的子控件
    NSArray *subViews = self.subviews;
    
    //确定单个控件的大小
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;
    
    NSInteger index = 0;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == count / 2) {
                index ++;
            }
            
            CGFloat btnX = index *btnW;
            subView.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index ++;
        }
    }
    
    self.middleView.centerX = self.frame.size.width * 0.5;
    self.middleView.y = self.height - self.middleView.height;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //设置允许交互的区域 圆弧形
    //1.转换点击在tabBar上的坐标点，到中间的按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.middleView];
    
    //2. 确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(33, 33);
    
    //3.计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));
    
    //4.判断中间按钮区域之外
    if (distance > 33 && pointInMiddleBtn.y < 18) {
        return NO;
    }
    return YES;
}

@end
