//
//  CLLocationManager+LocationServiceEnabled.h
//  Buddy
//
//  Created by 小伴 on 16/3/1.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (LocationServiceEnabled)

/** 检测GPS状态 */
+ (BOOL)locationServiceIsEnabled;

@end
