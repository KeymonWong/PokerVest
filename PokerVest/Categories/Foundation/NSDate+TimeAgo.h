//
//  NSDate+TimeAgo.h
//  RainbowBridge
//
//  Created by FarTeen on 8/14/14.
//  Copyright (c) 2014 cmri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeAgo)

- (NSString *)timeAgoWithDayInfo;
- (NSString *)timeYMDHM;

/**
 *  和微信保持一致的时间现实方式
 */
- (NSString *)timeAgoWithNewTypeDayInfo;

@end
