//
//  NSBundle+ViewFromXib.h
//  OA-Client
//
//  Created by FarTeen on 11/2/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ViewFromXib)

+ (UIView *)bundleViewFromXibWithIdentifer:(NSString *)identifier;

@end
