//
//  VDPushModule.m
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "VDPushModule.h"

// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

//极光推送
#import <JPUSHService.h>

#ifdef DEBUG
    #define kIsProduction NO
    #define kJPushAppKey @""
#else
    #define kIsProduction YES
    #define kJPushAppKey @""
#endif

@interface VDPushModule ()<JPUSHRegisterDelegate>
{
    NSDictionary *_remoteUserInfo;
}

@end

@implementation VDPushModule

#pragma mark - 启动推送SDK
- (void)startJPushSDKWithLaunchOptions:(NSDictionary *)launchOptions {
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
    }
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:launchOptions
                           appKey:kJPushAppKey
                          channel:@"App Store"
                 apsForProduction:kIsProduction];
    
    [JPUSHService setAlias:@"123456789" completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        DLog(@"%@",iAlias);
        if (iResCode == 0) {
            NSLog(@"添加别名成功");
        }
    } seq:1];
}

#pragma mark - 注册APNS
- (void)registerAPNS {
    /*
     警告：Xcode8的需要手动开启“TARGETS -> Capabilities -> Push Notifications”
     */
    
    /*
     警告：该方法需要开发者自定义，以下代码根据APP支持的iOS系统不同，代码可以对应修改。
     以下为演示代码，注意根据实际需要修改，注意测试支持的iOS系统都能获取到DeviceToken
     */
    /*
     if (iOS_Version >= 10.0) {
     #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0 // Xcode 8编译会调用
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     center.delegate = self;
     [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay) completionHandler:^(BOOL granted, NSError *_Nullable error) {
     if (!error) {
     NSLog(@"request authorization succeeded!");
     }
     }];
     
     [[UIApplication sharedApplication] registerForRemoteNotifications];
     #else // Xcode 7编译会调用
     UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
     UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
     [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
     [[UIApplication sharedApplication] registerForRemoteNotifications];
     #endif
     
     }*/
    
    if (iOS_Version >= 8.0) {
//        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 注册APNS
    [self registerAPNS];
    
    //启动SDK
    [self startJPushSDKWithLaunchOptions:launchOptions];
    
    //获取启动时收到的APN数据，App是用户点击推送消息启动
    NSDictionary *remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotification) {
#ifdef DEBUG
        NSString *record = [NSString stringWithFormat:@"[APN]%@, %@", [NSDate date], remoteNotification];
        DLog(@"从消息启动:%@-%@", remoteNotification, record);
#endif
        
        [JPUSHService setBadge:0];
        //跳转指定的页面
        //[self goToNewFriendViewControllerWith:remoteNotification];
        
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    }

    return YES;
}

//程序在后台时收到通知，点击通知栏进入app
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [JPUSHService setBadge:0];
}

// iOS 10 Support, APP在线状态通知会走这个方法
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [JPUSHService setBadge:0];
    if (@available(iOS 10.0, *)) {
        completionHandler(UNNotificationPresentationOptionAlert);
    } else {
        // Fallback on earlier versions
    } // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

//点击App图标，使App从后台恢复至前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}

//按Home键使App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application{
    [application setApplicationIconBadgeNumber:0];
    [application cancelAllLocalNotifications];
}

#if TARGET_OS_IPHONE

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError: %@", error);
}

#endif


// 在 iOS8 系统中，还需要添加这个方法。通过新的 API 注册推送服务
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

#pragma mark - 推送时，如果实现了-application:didReceiveRemoteNotification:fetchCompletionHandler:这个方法那么下面这个方法就不会被执行，如果上面那个方法没实现，那么就会执行下面的这方法。官方文档解释
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"didReceiveRemoteNotification");
}

#pragma mark - 此方法是用户点击了通知栏时调用，应用在前台或者开启后台并且应用在后台 时调起
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    NSLog(@"didReceiveRemoteNotification:fetchCompletionHandler:");
}

@end
