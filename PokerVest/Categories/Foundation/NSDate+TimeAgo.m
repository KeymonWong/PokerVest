//
//  NSDate+TimeAgo.m
//  RainbowBridge
//
//  Created by FarTeen on 8/14/14.
//  Copyright (c) 2014 cmri. All rights reserved.
//

#import "NSDate+TimeAgo.h"
#import "NSDate+Utilities.h"

@implementation NSDate (TimeAgo)

static NSDateFormatter *fmt_dateFormatter = nil;

- (NSString *)timeAgoWithDayInfo
{
    NSString *str_dayInfo = @"";
    if (!fmt_dateFormatter) {
        fmt_dateFormatter = [[NSDateFormatter alloc] init];
    }
    if ([self isToday]) {
        [fmt_dateFormatter setDateFormat:@"HH:mm"];
//        str_dayInfo = @"";
        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    } else if ([self isYesterday]) {
        [fmt_dateFormatter setDateFormat:@"HH:mm"];
        str_dayInfo = @"昨天 ";
        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    } else if ([self isDayBeforeYesterday]) {
        [fmt_dateFormatter setDateFormat:@"HH:mm"];
        str_dayInfo = @"前天 ";
        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    } else {
        [fmt_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        return [fmt_dateFormatter stringFromDate:self];
    }
}

- (NSString *)timeYMDHM
{
    if (!fmt_dateFormatter) {
        fmt_dateFormatter = [[NSDateFormatter alloc] init];
    }
    [fmt_dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    return [fmt_dateFormatter stringFromDate:self];
}

- (NSString *)timeAgoWithNewTypeDayInfo
{
    NSString *str_dayInfo = @"";
    if (!fmt_dateFormatter) {
        fmt_dateFormatter = [[NSDateFormatter alloc] init];
    }
    if ([self isToday]) {
        [fmt_dateFormatter setDateFormat:@"HH:mm"];
        //        str_dayInfo = @"";
        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    }
    if ([self isYesterday]) {
        [fmt_dateFormatter setDateFormat:@"HH:mm"];
        return @"昨天";
//        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    }
    if ([self isThisWeek]) {
        switch ([self weekday]) {
            case 1:
                return @"星期日";
                break;
            case 2:
                return @"星期一";
                break;
            case 3:
                return @"星期二";
                break;
            case 4:
                return @"星期三";
                break;
            case 5:
                return @"星期四";
                break;
            case 6:
                return @"星期五";
                break;
            case 7:
                return @"星期六";
                break;
            default:
                break;
        }
//        [fmt_dateFormatter setDateFormat:@"HH:mm"];
//        str_dayInfo = @"前天 ";
//        return [NSString stringWithFormat:@"%@%@",str_dayInfo,[fmt_dateFormatter stringFromDate:self]];
    } else {
        [fmt_dateFormatter setDateFormat:@"MM月dd日"];
        return [fmt_dateFormatter stringFromDate:self];
    } return @"";
}

@end
