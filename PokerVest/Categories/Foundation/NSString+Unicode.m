//
//  NSString+Unicode.m
//  OA-Client
//
//  Created by wangkai on 14/11/25.
//  Copyright (c) 2014年 CMCC. All rights reserved.
//

#import "NSString+Unicode.h"

@implementation NSString (Unicode)

-(NSString *)unicodeString
{
    NSUInteger length = [self length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++) {
        unichar _char = [self characterAtIndex:i];
        //判断是否为英文和数字
        /*if (_char <= '9' && _char >= '0') {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'a' && _char <= 'z')
        {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else
        {
            [s appendFormat:@"\\u%x",[self characterAtIndex:i]];
        }*/
        if (_char > 0x100 ) {
            [s appendFormat:@"\\u%x",[self characterAtIndex:i]];
        }else
        {
            [s appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }
    }
    return s;
}
@end
