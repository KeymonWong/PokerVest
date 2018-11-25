//
//  NSString+TextSize.h
//  Buddy
//
//  Created by 小伴 on 16/1/19.
//  Copyright © 2016年 wang kai. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CoreGraphics.h>

@interface NSString (TextSize)
/**
 *  单行文本计算宽度
 */
+ (CGSize)sizeOfSingleLineTextWithText:(NSString *)text fontSize:(CGFloat)fontSize;

/**
 *  多行文本计算高度
 */
+ (CGSize)sizeOfMultiLineTextWithText:(NSString *)text width:(CGFloat)width fontSize:(CGFloat)fontSize;

/**
 *  单行文本计算宽度
 */
- (CGSize)sizeOfSingleLineTextWithFontSize:(CGFloat)fontSize;
@end
