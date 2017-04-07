//
//  BelleNavBar.m
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import "BelleNavBar.h"

@implementation BelleNavBar

+ (void)setGlobalBackgroundImage:(UIImage *)globalImg {
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"ViewController"), nil];
    [navigationBar setBackgroundImage:globalImg forBarMetrics:UIBarMetricsDefault];
    
}

+ (void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize {
    if (globalTextColor == nil) {
        return;
    }
    if (fontSize < 6 || fontSize > 40) {
        
        fontSize = 16;
    }
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"ViewController"), nil];// 9.0 使用如下
//    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UIViewController class]]];
    NSDictionary *titleDic = @{NSForegroundColorAttributeName: globalTextColor,
                               NSFontAttributeName: [UIFont systemFontOfSize:fontSize]
                               };
    [navigationBar setTitleTextAttributes:titleDic];
    
}

@end
