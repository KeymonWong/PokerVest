//
//  UIView+ShowInWindow.m
//  TeacherClient
//
//  Created by FarTeen on 11/4/14.
//  Copyright (c) 2014 FarTeen. All rights reserved.
//

#import "UIView+ShowInWindow.h"

#define gMaskViewFlag   8888

@implementation UIView (ShowInWindow)

- (void)showInWindowAnimated:(BOOL)animated
{
    [self showInWindowAnimated:animated completionBlock:NULL];
}

- (void)showInWindowWithTop:(CGFloat)top animated:(BOOL)animated
{
    [self showInWindowWithTop:top animated:animated completionBlock:NULL];
}

- (void)showInWindowAnimated:(BOOL)animated completionBlock:(void(^)(void))completion
{
    [self showInWindowWithTop:(kScreenHeight - self.height) animated:animated completionBlock:completion];
}

- (void)showInWindowWithTop:(CGFloat)top animated:(BOOL)animated completionBlock:(void(^)(void))completion
{
    if (animated) {
        self.top = kScreenHeight;
    }
    self.alpha = 1.;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIButton *maskView = [[UIButton alloc] initWithFrame:window.bounds];
    maskView.tag = gMaskViewFlag;
    maskView.alpha = 1.;
    maskView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:.8];
    [maskView addTarget:self action:@selector(dismissShowingView:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:maskView];
    [window addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        maskView.alpha = 1.;
        if (animated) {
            self.top = top;
        }
        self.alpha = 1.;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated top:(CGFloat)top completionBlock:(void(^)(void))completion
{
    if (animated) {
        self.top = kScreenHeight;
    }
    self.alpha = 1.;
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    UIButton *maskView = [[UIButton alloc] initWithFrame:view.bounds];
    maskView.tag = gMaskViewFlag;
    maskView.alpha = 1.;
    maskView.backgroundColor = [UIColor clearColor];
    [maskView addTarget:self action:@selector(dismissShowingView:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:maskView];
    [view addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        maskView.alpha = 1.;
        if (animated) {
            self.top = top;
        }
        self.alpha = 1.;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}
/**
 *  默认在中间
 */
- (void)showInView:(UIView *)view animated:(BOOL)animated
{
    [self showInView:view animated:animated top:0];
}
/**
 *  以一个top来作为target
 */
- (void)showInView:(UIView *)view animated:(BOOL)animated top:(CGFloat)top
{
    [self showInView:view animated:animated top:top completionBlock:NULL];
}

- (void)hideInWindow
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIButton *btn_mask = (UIButton *)[window viewWithTag:gMaskViewFlag];
    [self dismissShowingView:btn_mask];
}

- (void)dismissShowingView:(UIButton *)btn
{
    [UIView animateWithDuration:.3 animations:^{
        btn.alpha = 0.;
        self.alpha = 0.;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)showInWindowWithTransformAnimatoin:(BOOL)animated top:(CGFloat)top completionBlock:(dispatch_block_t)completion
{
    if (animated) {
        self.top = top;
        self.transform = CGAffineTransformMakeScale(0., 0.);
    }
    self.alpha = 1.;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    UIButton *maskView = [[UIButton alloc] initWithFrame:window.bounds];
    maskView.tag = gMaskViewFlag;
    maskView.alpha = 1.;
    maskView.backgroundColor = [UIColor clearColor];
    [maskView addTarget:self action:@selector(dismissByTransformShowingView:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:maskView];
    [window addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        self.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)dismissByTransformShowingView:(UIButton *)btn
{
    [UIView animateWithDuration:.3 animations:^{
        btn.alpha = 0.;
        self.alpha = 0.;
    } completion:^(BOOL finished) {
        [btn removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
