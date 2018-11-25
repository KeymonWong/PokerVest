//
//  NSString+DecimalToBinary.h
//  Buddy
//
//  Created by 小伴 on 16/6/20.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DecimalToBinary)
/** 十进制转换为二进制 */
+ (NSString *)stringOfDecimalToBinaryWithDecimal:(NSString *)decimal;
@end
