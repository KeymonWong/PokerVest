//
//  UIView+ShowInWindow.h
//  TeacherClient
//
//  Created by FarTeen on 11/4/14.
//  Copyright (c) 2014 FarTeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShowInWindow)

- (void)showInView:(UIView *)view animated:(BOOL)animated top:(CGFloat)top completionBlock:(void(^)(void))completion;
/**
 *  默认在中间
 */
- (void)showInView:(UIView *)view animated:(BOOL)animated;
/**
 *  以一个top来作为target
 */
- (void)showInView:(UIView *)view animated:(BOOL)animated top:(CGFloat)top;

- (void)showInWindowAnimated:(BOOL)animated;
- (void)showInWindowWithTop:(CGFloat)top animated:(BOOL)animated;
- (void)showInWindowAnimated:(BOOL)animated completionBlock:(void(^)(void))completion;
- (void)showInWindowWithTransformAnimatoin:(BOOL)animated top:(CGFloat)top completionBlock:(dispatch_block_t)completion ;


- (void)hideInWindow;

@end
