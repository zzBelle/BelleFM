//
//  BelleNavigationController.m
//  BelleFM
//
//  Created by 十月 on 17/3/31.
//  Copyright © 2017年 October. All rights reserved.
//

#import "BelleNavigationController.h"
#import "BelleNavBar.h"
#import "BelleMiddleView.h"
@interface BelleNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BelleNavigationController

- (instancetype) initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[BelleNavBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   //设置手势代理
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    
    //自定义手势 手势添加在谁的身上以及执行了什么方法
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    //就是控制器的容器视图
    [gester.view addGestureRecognizer:panGester];
    
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;

}

- (void)back {
    [self popViewControllerAnimated:YES];

}

/**
    当控制器，拿到导航控制器（需要是这个子类）， 进行压栈时都会调用这个方法
    viewController 需要压栈的控制器
    animate 动画
 
 */
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //拦截每一个pus的控制器进行统一设置
    //过滤第一个跟控制器
    if (self.childViewControllers.count > 0) {
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_n"] style:0 target:self action:@selector(back)];
    }
    //  不能忘记push
    [super pushViewController:viewController animated:animated];
    if (viewController.view.tag == 1000) {
        viewController.view.tag = 2000;
       BelleMiddleView  *middleView = [BelleMiddleView middleView];
        
        middleView.middleClickBlock = [BelleMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [BelleMiddleView shareInstance].isPlaying;
        middleView.middleImg = [BelleMiddleView shareInstance].middleImg;
        
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [viewController.view addSubview:middleView];
        
    }

    
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
   //如果根控制器也要返回手势就会假死 所以要过滤根控制器
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
