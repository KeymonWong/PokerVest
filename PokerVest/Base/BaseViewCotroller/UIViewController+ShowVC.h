//
//  UIViewController+ShowVC.h
//  OA-iOS-Client
//
//  Created by FarTeen on 10/31/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowVC)

+ (void)showMainRootContainerViewControllerAnimated:(BOOL)animated;

+ (void)showMainTabBarAnimated:(BOOL)animated;
+ (void)showLoginMethodControllerAnimated:(BOOL)animated;
+ (void)showLoginControllerAnimated:(BOOL)animated;
+ (void)showNextLoginControllerAnimated:(BOOL)animated;
+ (void)showCompleteInfoViewControllerAnimated:(BOOL)animated;

+ (void)setMainViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
