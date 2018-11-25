//
//  F3HTileAppearanceProvider.h
//  Tlm2048
//
//  Created by pokerVest2048 on 15/9/22.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol F3HTileAppearanceProviderProtocol <NSObject>

- (UIColor *)tileColorForValue:(NSUInteger)value;
- (UIColor *)numberColorForValue:(NSUInteger)value;
- (UIFont *)fontForNumbers;

@end

@interface F3HTileAppearanceProvider : NSObject

@end
