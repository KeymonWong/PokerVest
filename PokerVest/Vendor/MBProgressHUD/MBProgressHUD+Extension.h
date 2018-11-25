//
//  MBProgressHUD+Extension.h
//  XiaobanParent
//
//  Created by huangqimeng on 2017/12/21.
//  Copyright © 2017年 xiaoban. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extension)

/**
 @brief 加载中...只有菊花,已经放入主线程
 */
+ (void)showHUD;

/**
 @brief 加载中...只有菊花,已经放入主线程
 */
+ (void)hideHUD;



/**
 @brief 错误提示，默认 2s 后自动消失，显示在 window 上
 
 @param status 错误内容
 */
+ (void)showErrorStatus:(NSString *)status;

/**
 @brief 成功提示，默认 2s 后自动消失，显示在 window 上
 
 @param status 成功内容
 */
+ (void)showSuccessStatus:(NSString *)status;

/**
 @brief 其他提示

 @param tip 内容
 @param parentView hud显示的父view
 @param stay 停留时间
 */
+ (void)showTip:(NSString *)tip toView:(UIView *)parentView stay:(NSTimeInterval)stay;


/**
 文字加菊花

 @param tip tip
 @param view view
 */
+ (void)showTip:(NSString *)tip ToView:(UIView *)view;

@end
