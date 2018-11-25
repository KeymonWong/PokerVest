//
//  NSBundle+MainBundleCell.m
//  OA-Client
//
//  Created by FarTeen on 11/2/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "NSBundle+MainBundleView.h"

@implementation NSBundle (MainBundleView)

+ (UIView *)mainBundleViewWithIdentifer:(NSString *)identifier
{
    return [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
}

@end
