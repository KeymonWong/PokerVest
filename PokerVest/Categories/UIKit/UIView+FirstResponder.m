//
//  UIView+FirstResponder.m
//  XiaobanParent
//
//  Created by huangqimeng on 2018/1/21.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

#import "UIView+FirstResponder.h"

@implementation UIView (FirstResponder)
#pragma mark - 查找 View 的第一响应者
+ (UIView *)findFirstResponderBeneathView:(UIView*)view {
    // Search recursively for first responder
    for ( UIView *childView in view.subviews ) {
        if ( [childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder] ) return childView;
        UIView *result = [self findFirstResponderBeneathView:childView];
        if ( result ) return result;
    }
    return nil;
}
@end
