//
//  VDConfigEngine.h
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UserNotifications;

NS_ASSUME_NONNULL_BEGIN

@protocol VDConfigEngineProtocol <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@end

@interface VDConfigEngine : NSObject<UIApplicationDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)sharedEngine;

- (NSArray<id<VDConfigEngineProtocol>> *)allModules;

@end

NS_ASSUME_NONNULL_END
