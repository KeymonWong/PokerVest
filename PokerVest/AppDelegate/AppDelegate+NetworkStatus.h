//
//  AppDelegate+NetworkStatus.h
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "AppDelegate.h"

#import <AFNetworking/AFNetworkReachabilityManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (NetworkStatus)

@property (nonatomic, assign) NSInteger networkStatus;

- (void)monitorNetwork;
@end

NS_ASSUME_NONNULL_END
