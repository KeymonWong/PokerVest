//
//  NSObject+LocationConvert.h
//  Buddy
//
//  Created by wang kai on 15/10/10.
//  Copyright © 2015年 wang kai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface NSObject (LocationConvert)
/**
 * 经纬度字符串(@"经度,纬度")转坐标
 */
+(CLLocationCoordinate2D) locationToCoordinate2D:(NSString *)location;
@end
