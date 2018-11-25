//
//  UIImage+ImageResize.m
//  OA-iOS-Client
//
//  Created by FarTeen on 10/31/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "UIImage+ImageResize.h"

@implementation UIImage (ImageResize)

- (UIImage *)resizeImageWithLeft:(CGFloat)left top:(CGFloat)top
{
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top, left)];
}

@end
