//
//  NSString+URLEncoding.m
//  TeacherClient
//
//  Created by FarTeen on 8/25/14.
//  Copyright (c) 2014 FarTeen. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

- (NSString *)urlEncoding
{
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                        (__bridge CFStringRef)self,
                                                                        NULL,
                                                                        (CFStringRef)@"!*'\"();.:@&=+$,/?%#[]% ",
                                                                        CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}


@end
