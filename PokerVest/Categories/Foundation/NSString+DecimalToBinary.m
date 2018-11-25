
//
//  NSString+DecimalToBinary.m
//  Buddy
//
//  Created by 小伴 on 16/6/20.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "NSString+DecimalToBinary.h"

@implementation NSString (DecimalToBinary)

+ (NSString *)stringOfDecimalToBinaryWithDecimal:(NSString *)decimal {

    int num = [decimal intValue];
    int remainder = 0;      //余数
    int divisor = 0;        //除数

    NSString *prepare = @"";

    while (true) {
        remainder = num%2;
        divisor = num/2;
        num = divisor;

        prepare = [prepare stringByAppendingFormat:@"%d",remainder];

        if (divisor == 0) {
            break;
        }
    }

    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i--) {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return result;
}

@end
