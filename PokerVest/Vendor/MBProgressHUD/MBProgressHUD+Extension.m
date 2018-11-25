//
//  MBProgressHUD+Extension.m
//  XiaobanParent
//
//  Created by huangqimeng on 2017/12/21.
//  Copyright © 2017年 xiaoban. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)

+ (void)showHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *oldHUD = [MBProgressHUD HUDForView:[UIApplication sharedApplication].delegate.window];
        if (oldHUD) {
            [oldHUD removeFromSuperview];
        }
        
        [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    });
}

+ (void)hideHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *oldHUD = [MBProgressHUD HUDForView:[UIApplication sharedApplication].delegate.window];
        [oldHUD hideAnimated:YES];
    });
}

+ (void)showMsg:(NSString *)msg toView:(UIView *)view stay:(NSTimeInterval)stay withFlag:(NSInteger)flag {
    UIView *aView = (view != nil) ? view : [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *oldHUD = [MBProgressHUD HUDForView:aView];
    if (oldHUD) {
        [oldHUD removeFromSuperview];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
//    hud.bezelView.blurEffectStyle = UIBlurEffectStyleDark;
    
    NSString *imgName = nil;
    switch (flag) {
        case 0: {
            imgName = [NSString stringWithFormat:@"MBProgressHUD.bundle/%@",@"error.png"];
        } break;
        case 1: {
            imgName = [NSString stringWithFormat:@"MBProgressHUD.bundle/%@",@"success.png"];
        } break;
        case 2: {
            imgName = nil;
        } break;
            
        default:
            break;
    }
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    hud.label.text = msg;
    
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hideAnimated:YES afterDelay:stay];
}

+ (void)showErrorStatus:(NSString *)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showMsg:status toView:nil stay:2. withFlag:0];
    });
}

+ (void)showSuccessStatus:(NSString *)status {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showMsg:status toView:nil stay:2. withFlag:1];
    });
}

+ (void)showTip:(NSString *)tip toView:(UIView *)parentView stay:(NSTimeInterval)stay {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showMsg:tip toView:parentView stay:stay withFlag:2];
    });
}

#pragma mark 显示一些信息
+ (void)showTip:(NSString *)tip ToView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = tip;
    //    hud.labelFont=CHINESE_MBProgressHUD_SYSTEM(15);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
    
    //    hud.dimBackground = YES;
}

@end
