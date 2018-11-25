//
//  NSBundle+ViewFromXib.m
//  OA-Client
//
//  Created by FarTeen on 11/2/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "NSBundle+ViewFromXib.h"

@implementation NSBundle (ViewFromXib)

+ (UIView *)bundleViewFromXibWithIdentifer:(NSString *)identifier {
    return [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] lastObject];
}

@end
