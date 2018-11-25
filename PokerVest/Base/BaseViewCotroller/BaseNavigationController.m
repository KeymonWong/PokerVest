//
//  CRNavigationController.m
//  OA-iOS-Client
//
//  Created by FarTeen on 10/30/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

//所以我们要自己创建一个继承于UINavigationcontroller的
//NavigationController，在这个子类中重写
//childViewControllerForStatusBarStyle函数
//这样navigationController中的childViewControllerForStatusBarStyle函数会返回
//navigationController中最上层的viewController，那么viewController中的
//preferredStatusBarStyle函数的设置就会被系统获知

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

//好像这个没啥用
//- (void)viewWillAppear:(BOOL)animated
//{
//    [self setNeedsStatusBarAppearanceUpdate];
//}

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.orientationMask = UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationBar.hidden = YES;
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.orientationMask;
}

@end
