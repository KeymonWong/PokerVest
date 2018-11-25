//
//  NSString+ToAttributedString.h
//  Buddy
//
//  Created by 小伴 on 16/4/21.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (ToAttributedString)
/** NSString 2 NSMutableAttributedString (比如文本里面带图片) */
- (NSMutableAttributedString *)convert2AttributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds atIndex:(NSInteger)index;
/** 不同文字设置不同的颜色 */
- (NSMutableAttributedString *)convert2AttributedStringWithTextColor:(UIColor *)textColor range:(NSRange)range;
@end
