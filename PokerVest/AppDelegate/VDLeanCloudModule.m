//
//  VDLeanCloudModule.m
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "VDLeanCloudModule.h"

#import <AVOSCloud/AVOSCloud.h>

#define kLeanCloudAppId @"BkI7APFdVItwlNHOa3yce47m-gzGzoHsz"
#define kLeanCloudAppKey @"IkgJVaJmLHGySumPpRfFaaXs"

@interface VDLeanCloudModule ()

@end

@implementation VDLeanCloudModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AVOSCloud setApplicationId:kLeanCloudAppId clientKey:kLeanCloudAppKey];
    
#ifdef DEBUG
    // 放在 SDK 初始化语句 [AVOSCloud setApplicationId:] 后面，只需要调用一次即可
    [AVOSCloud setAllLogsEnabled:YES];
#endif
    
    return YES;
}

@end
