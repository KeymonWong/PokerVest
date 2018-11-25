//
//  VDConfigEngine.m
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "VDConfigEngine.h"
#import <UserNotifications/UserNotifications.h>

@interface VDConfigEngine ()
@property (nonatomic, strong) NSMutableArray<id<VDConfigEngineProtocol>> *moduleBox;
@end

@implementation VDConfigEngine

+ (instancetype)sharedEngine {
    static VDConfigEngine *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[VDConfigEngine alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"VDModuleRegister" ofType:@"plist"];
        [self loadModulesFromPlistFilePath:plistPath];
    }
    return self;
}

- (void)loadModulesFromPlistFilePath:(NSString *)plistFile {
    NSArray<NSString *> *moduleNames = [NSArray arrayWithContentsOfFile:plistFile];
    for (NSString *moduleName in moduleNames) {
        id<VDConfigEngineProtocol> module = [[NSClassFromString(moduleName) alloc] init];
        [self addModule:module];
    }
}

- (NSMutableArray<id<VDConfigEngineProtocol>> *)moduleBox {
    if (!_moduleBox) {
        _moduleBox = [NSMutableArray array];
    }
    return _moduleBox;
}

- (void)addModule:(id<VDConfigEngineProtocol>)module {
    if (![self.moduleBox containsObject:module]) {
        [self.moduleBox addObject:module];
    }
}

- (NSArray<id<VDConfigEngineProtocol>> *)allModules {
    return [self.moduleBox copy];
}


/***/
#pragma mark - UIApplicationDelegate
/***/
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DLog(@"%s", __FUNCTION__);
    
    BOOL flag = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            BOOL tempFlag = [module application:application willFinishLaunchingWithOptions:launchOptions];
            if (!flag) {
                flag = tempFlag;
            }
        }
    }
    return flag;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DLog(@"%s", __FUNCTION__);
    
    BOOL flag = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            BOOL tempFlag = [module application:application didFinishLaunchingWithOptions:launchOptions];
            if (!flag) {
                flag = tempFlag;
            }
        }
    }
    return flag;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidEnterBackground:application];
        }
    }
}

// Called when leaving the foreground state.
- (void)applicationWillResignActive:(UIApplication *)application {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillResignActive:application];
        }
    }
}

// Called when transitioning out of the background state.
- (void)applicationWillEnterForeground:(UIApplication *)application {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillTerminate:application];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application  performFetchWithCompletionHandler:completionHandler];
        }
    }
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    DLog(@"%s", __FUNCTION__);
    
    BOOL flag = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            BOOL tempFlag = [module application:application openURL:url options:options];
            if (!flag) {
                flag = tempFlag;
            }
        }
    }
    return flag;
}

#else

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    DLog(@"%s", __FUNCTION__);
    
    BOOL flag = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            BOOL tempFlag = [module application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
            if (!flag) {
                flag = tempFlag;
            }
        }
    }
    return flag;
}

#endif

#pragma mark - Handling Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}


//iOS 10中收到推送消息

//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0

//iOS 10: App在前台获取到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center
                   willPresentNotification:notification
                     withCompletionHandler:completionHandler];
        }
    }
}

//iOS 10: 点击通知进入App时触发
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module userNotificationCenter:center
            didReceiveNotificationResponse:response
                     withCompletionHandler:completionHandler];
        }
    }
}

//#else

// Deprecated from iOS 10.0

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)(void))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application
     handleActionWithIdentifier:identifier
          forRemoteNotification:userInfo
              completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)(void))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application
     handleActionWithIdentifier:identifier
          forRemoteNotification:userInfo
               withResponseInfo:responseInfo
              completionHandler:completionHandler];
        }
    }
}

/****************/

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveLocalNotification:notification];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)(void))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application
     handleActionWithIdentifier:identifier
           forLocalNotification:notification
              completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)(void))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application
     handleActionWithIdentifier:identifier
           forLocalNotification:notification
               withResponseInfo:responseInfo
              completionHandler:completionHandler];
        }
    }
}

//#endif



#pragma mark - Handling Continuing User Activity and Handling Quick Actions

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType {
    DLog(@"%s", __FUNCTION__);
    
    BOOL result = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            result = result || [module application:application willContinueUserActivityWithType:userActivityType];
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    DLog(@"%s", __FUNCTION__);
    
    BOOL result = NO;
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            result = result || [module application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
        }
    }
    return result;
}

- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didUpdateUserActivity:userActivity];
        }
    }
}

- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType
              error:(NSError *)error {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFailToContinueUserActivityWithType:userActivityType error:error];
        }
    }
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL succeeded))completionHandler {
    DLog(@"%s", __FUNCTION__);
    
    for (id<VDConfigEngineProtocol> module in self.moduleBox) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application
   performActionForShortcutItem:shortcutItem
              completionHandler:completionHandler];
        }
    }
}


@end
