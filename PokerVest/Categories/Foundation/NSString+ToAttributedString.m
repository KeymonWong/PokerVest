//
//  NSString+ToAttributedString.m
//  Buddy
//
//  Created by 小伴 on 16/4/21.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "NSString+ToAttributedString.h"

@implementation NSString (ToAttributedString)

- (NSMutableAttributedString *)convert2AttributedStringWithImage:(UIImage *)image bounds:(CGRect)bounds atIndex:(NSInteger)index {
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = bounds;
    NSAttributedString *attrStr = [NSAttributedString attributedStringWithAttachment:attachment];
    NSMutableAttributedString *muattrStr = [[NSMutableAttributedString alloc] initWithString:self];

    [muattrStr beginEditing];
    [muattrStr insertAttributedString:attrStr atIndex:index];
    [muattrStr endEditing];

    return muattrStr;
}

- (NSMutableAttributedString *)convert2AttributedStringWithTextColor:(UIColor *)textColor range:(NSRange)range {
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self];
    NSMutableAttributedString *muAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:attrStr];
    [muAttrStr addAttribute:NSForegroundColorAttributeName
                      value:textColor
                      range:range];

    return muAttrStr;
}

@end
