//
//  BelleTabBarController.m
//  BelleFM
//
//  Created by 十月 on 17/4/5.
//  Copyright © 2017年 October. All rights reserved.
//

#import "BelleTabBarController.h"
#import "BelleTabBar.h"
#import "BelleNavigationController.h"
#import "UIImage+BelleImage.h"
#import "BelleMiddleView.h"
@interface BelleTabBarController ()

@end

@implementation BelleTabBarController

+ (instancetype)shareInstance {
    static BelleTabBarController *tabBarController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        tabBarController  = [[BelleTabBarController alloc] init];
    });
    return tabBarController;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(BelleTabBarController *))addVCBlock {
    BelleTabBarController *tabbarVC = [[BelleTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    return tabbarVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabBar
    [self setUpTabbar];
    
}

- (void)setUpTabbar {
    [self setValue:[[BelleTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    if (isRequired) {
        BelleNavigationController *navigationC = [[BelleNavigationController alloc] initWithRootViewController:vc];
        navigationC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:navigationC];
    }else {
        [self addChildViewController:vc];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 1000) {
        vc.view.tag = 2000;
        BelleMiddleView *middleView = [BelleMiddleView middleView];
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
        [vc.view addSubview:middleView];
    }
    
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
