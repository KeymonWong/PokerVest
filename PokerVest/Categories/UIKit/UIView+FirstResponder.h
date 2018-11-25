//
//  UIView+FirstResponder.h
//  XiaobanParent
//
//  Created by huangqimeng on 2018/1/21.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FirstResponder)

#pragma mark - 查找 View 的第一响应者
+ (UIView *)findFirstResponderBeneathView:(UIView*)view;

@end
