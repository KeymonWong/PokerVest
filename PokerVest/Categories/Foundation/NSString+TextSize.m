//
//  NSString+TextSize.m
//  Buddy
//
//  Created by 小伴 on 16/1/19.
//  Copyright © 2016年 wang kai. All rights reserved.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)

/**
 *  单行文本(实际宽度)
 */
+ (CGSize)sizeOfSingleLineTextWithText:(NSString *)text fontSize:(CGFloat)fontSize
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:fontSize]};
    CGSize size = [text sizeWithAttributes:attributes];
    return size;
}

/**
 *  多行文本(实际高度)
 */
+ (CGSize)sizeOfMultiLineTextWithText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:fontSize]};
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil].size;
    return size;
}

- (CGSize)sizeOfSingleLineTextWithFontSize:(CGFloat)fontSize {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:fontSize]};
    CGSize size = [self sizeWithAttributes:attributes];
    return size;
}

@end
