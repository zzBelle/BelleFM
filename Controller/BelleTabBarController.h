//
//  BelleTabBarController.h
//  BelleFM
//
//  Created by 十月 on 17/4/5.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BelleTabBarController : UITabBarController

//获取单例对象
+ (instancetype) shareInstance;

/**
    添加自控制器block
  addVCBlock 添加代码块
  TabBarController
 */

+ (instancetype) tabBarControllerWithAddChildVCsBlock: (void(^)(BelleTabBarController *tabBarController))addVCBlock;
/**
    添加子控制器
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 
 */
- (void)addChildVC:(UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName: (NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
@end
