//
//  NSArray+ArrayWithOrder.m
//  TeacherClient
//
//  Created by FarTeen on 9/17/14.
//  Copyright (c) 2014 FarTeen. All rights reserved.
//

#import "NSArray+ArrayWithOrder.h"

@implementation NSArray (ArrayWithOrder)

- (NSArray *)arrayIsAsending:(BOOL)isAsending withkey:(NSString *)key
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:isAsending];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

@end
