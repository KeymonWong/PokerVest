//
//  UITableView+ConfigTableView.m
//  Buddy
//
//  Created by 小伴 on 16/1/15.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "UITableView+ConfigTableView.h"

@implementation UITableView (ConfigTableView)

- (void)configTableView
{
    [self clearUselessSeperatorCell];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
#endif
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}

- (void)clearUselessSeperatorCell
{
    UIView *v_fake = [[UIView alloc] initWithFrame:CGRectZero];
    v_fake.backgroundColor = [UIColor clearColor];
    self.tableFooterView = v_fake;
}

@end
