//
//  UITableView+ClearUselessCellSeperator.m
//  OA-Client
//
//  Created by FarTeen on 12/1/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "UITableView+ClearUselessCellSeperator.h"

@implementation UITableView (ClearUselessCellSeperator)

- (void)clearUselessSeperatorCell
{
    UIView *v_fake = [[UIView alloc] initWithFrame:CGRectZero];
    v_fake.backgroundColor = [UIColor clearColor];
    self.tableFooterView = v_fake;
}

@end
