//
//  AppDelegate.m
//  PokerVest
//
//  Created by keymon on 2018/11/17.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

#import "VDConfigEngine.h"

#import "AppDelegate+NetworkStatus.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[VDConfigEngine sharedEngine] application:application didFinishLaunchingWithOptions:launchOptions];
    
    [self monitorNetwork];
    
    return YES;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [[VDConfigEngine sharedEngine] application:app openURL:url options:options];
}

#else

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[VDConfigEngine sharedEngine] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

#endif

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [[VDConfigEngine sharedEngine] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [[VDConfigEngine sharedEngine] application:application didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[VDConfigEngine sharedEngine] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[VDConfigEngine sharedEngine] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [[VDConfigEngine sharedEngine] application:application
               didReceiveRemoteNotification:userInfo
                     fetchCompletionHandler:completionHandler];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    [[VDConfigEngine sharedEngine] userNotificationCenter:center
                               willPresentNotification:notification
                                 withCompletionHandler:completionHandler];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler
{
    [[VDConfigEngine sharedEngine] userNotificationCenter:center
                        didReceiveNotificationResponse:response
                                 withCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [[VDConfigEngine sharedEngine] application:application
          performFetchWithCompletionHandler:completionHandler];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    [[VDConfigEngine sharedEngine] applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[VDConfigEngine sharedEngine] applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    application.applicationIconBadgeNumber = 0;
    
    [[VDConfigEngine sharedEngine] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [[VDConfigEngine sharedEngine] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [[VDConfigEngine sharedEngine] applicationWillTerminate:application];
}

@end
