//
//  OKLogicModule.m
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "OKLogicModule.h"

#import "OKRootViewController.h"

#import "AppDelegate+NetworkStatus.h"

@interface OKLogicModule ()

@end

@implementation OKLogicModule


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [((AppDelegate *)[UIApplication sharedApplication].delegate) monitorNetwork];
    
    [self configureSystemAppearance];
    
    NSString *oldAppVersion = UserDefaultsObjectForKey(kOldLocaleAppVersion);
    // 获取当前版本号
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
//    //有新的版本就去引导页面
//    if (oldAppVersion == nil || [oldAppVersion compare:currentVersion options:NSNumericSearch] == NSOrderedAscending) {
//        // 存首次使用的日期
//        UserDefaultsSetObjectForKey(currentVersion, kOldLocaleAppVersion);
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//        NSString *firstUseDate =[dateFormatter stringFromDate:[NSDate date]];
//        UserDefaultsSetObjectForKey(firstUseDate, kFirstUseDate);
//        OBGuidanceViewController *vc = [[OBGuidanceViewController alloc] init];
//        BaseNavigationController *nvc = [[BaseNavigationController alloc] initWithRootViewController:vc];
//        nvc.navigationBar.hidden = YES;
//        kAppRootViewController = nvc;
//    } else {
//        //        [UserDefaults setBool:NO forKey:kFirstLaunch];
//        //        [UserDefaults synchronize];
//        UserDefaultsSetObjectForKey(currentVersion, kOldLocaleAppVersion);
//        [self configRootViewController];
//    }
    
    return YES;
}

- (void)configureSystemAppearance {
    ///<iOS 11 适配
    // AppDelegate 进行全局设置
#ifdef __IPHONE_11_0
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
#endif
    
    //避免在一个界面上同时点击多个UIButton导致同时响应多个方法。从而避免bug
    //ps:可能在低版本系统会有崩溃现象，因为exclusiveTouch不是声明的UI_APPEARANCE_SELECTOR
    [[UIButton appearance] setExclusiveTouch:YES];
}

#pragma mark - 设置根视图控制器
- (void)configRootViewController {
    
}

@end
