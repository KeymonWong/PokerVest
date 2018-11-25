//
//  UINavigationController+StatusBar.m
//  Buddy
//
//  Created by 小伴 on 2016/11/27.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}
@end
