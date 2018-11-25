//
//  NSObject+LocationConvert.m
//  Buddy
//
//  Created by wang kai on 15/10/10.
//  Copyright © 2015年 wang kai. All rights reserved.
//

#import "NSObject+LocationConvert.h"

@implementation NSObject (LocationConvert)

+(CLLocationCoordinate2D)locationToCoordinate2D:(NSString *)location
{
    NSArray *array = [location componentsSeparatedByString:@","];
    if (array && [array count] > 1) {
        NSString *longitude = [array objectAtIndex:0];
        NSString *latitude = [array objectAtIndex:1];
        return CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
    }else{
        return CLLocationCoordinate2DMake(0, 0);
    }
}

@end
