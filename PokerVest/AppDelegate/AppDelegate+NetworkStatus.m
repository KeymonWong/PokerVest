//
//  AppDelegate+NetworkStatus.m
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "AppDelegate+NetworkStatus.h"

#import <objc/runtime.h>

#define AppDelegateAlertViewDuration                    0.5
#define AppDelegateNetworkAlerTitleFontSize             15.0f
#define AppDelegateNetworkAlertTag                      999
#define AppDelegateNetworkDisconnectedTitle             @"网络连接已断开"
#define AppDelegateNetworkConnectedTitle                @"已连接互联网"
#define AppDelegateNetwork3GConnectedTitle              @"当前为运营商网络"
#define AppDelegateNetworkWifiConnectedTitle            @"已连接到本地WiFi"

#define ColorSixTeen(s,al)  ([UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:al])


static const void * kNetworkStatusSetterGetterKey = &kNetworkStatusSetterGetterKey;

@implementation AppDelegate (NetworkStatus)

- (void)setNetworkStatus:(NSInteger)networkStatus {
    objc_setAssociatedObject(self, kNetworkStatusSetterGetterKey, @(networkStatus), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)networkStatus {
    return [objc_getAssociatedObject(self, kNetworkStatusSetterGetterKey) integerValue];
}

- (void)monitorNetwork {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    self.networkStatus = (NSInteger)manager.networkReachabilityStatus;
    [manager startMonitoring];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkingStatusDidChanged:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
}

- (void)networkingStatusDidChanged:(NSNotification *)info {
    NSDictionary *infoDict = [info userInfo];
    NSNumber *statusNum = infoDict[AFNetworkingReachabilityNotificationStatusItem];
//    if (status == nil || [statusStr isBlankString]) {
//        statusStr = [NSObject getStringFromDict:inforDict withKey:@"LCNetworkingReachabilityNotificationStatusItem"];
//    }
//
    NSInteger status = [statusNum integerValue];
    
    if (status != AFNetworkReachabilityStatusNotReachable) {
        //[self getSystemConfig];
    }
    
    if (self.isFirstLoad == YES) {
        self.isFirstLoad = NO;
        self.networkStatus = status;
        return;
    }
    
    if (status == self.networkStatus) {
        return;
    }
    
    self.networkStatus = status;
    if (status != AFNetworkReachabilityStatusNotReachable && status != AFNetworkReachabilityStatusUnknown) {
        if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            [AppDelegate show3GNetworkAlert];
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            [AppDelegate showWifiNetworkAlert];
        }else{
            [AppDelegate showOtherNetworkAlert];
        }
    }else{
        [AppDelegate showNoNetworkAlert];
    }
}

+ (void)show3GNetworkAlert{
    [self showViewWithTitle:AppDelegateNetwork3GConnectedTitle
                  withImage:[UIImage imageNamed:@"networkConnect"]
        withBackgroundColor:ColorSixTeen(0xfc6363, 1)];
}

+ (void)showWifiNetworkAlert{
    [self showViewWithTitle:AppDelegateNetworkWifiConnectedTitle
                  withImage:[UIImage imageNamed:@"networkConnect"]
        withBackgroundColor:ColorSixTeen(0xfb7272, 1)];//SYSTEM_DEFAULT_COLOR
}

+ (void)showOtherNetworkAlert{
    [self showViewWithTitle:AppDelegateNetworkConnectedTitle
                  withImage:[UIImage imageNamed:@"networkConnect"]
        withBackgroundColor:ColorSixTeen(0xfb7272, 1)];//SYSTEM_DEFAULT_COLOR;
}

+ (void)showNoNetworkAlert{
    [self showViewWithTitle:AppDelegateNetworkDisconnectedTitle
                  withImage:[UIImage imageNamed:@"networkDisconnect"]
        withBackgroundColor:ColorSixTeen(0x999999, 1)];
}

+ (UIView *)showViewWithTitle:(NSString*)title withImage:(UIImage*)image withBackgroundColor:(UIColor*)color{
    UIView *view = [[UIApplication sharedApplication].delegate.window viewWithTag:AppDelegateNetworkAlertTag];
    if (view == nil) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, -kScreenHeight, kScreenWidth, kNavBarHeight+kStatusBarHeight)];
        [view setTag:AppDelegateNetworkAlertTag];
        [[UIApplication sharedApplication].delegate.window addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, kStatusBarHeight+(kNavBarHeight - 25)*0.5, 25, 25)];
        [view addSubview:imageView];
        [imageView setTag:111];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, imageView.frame.origin.y, kScreenWidth - 60, 25)];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont systemFontOfSize:16]];
        [label setTag:222];
        [view addSubview:label];
    }
    
    [view setBackgroundColor:color];
    
    UIImageView *imageView = [view viewWithTag:111];
    if (imageView) {
        [imageView setImage:image];
    }
    
    UILabel *label = [view viewWithTag:222];
    if (label) {
        [label setText:title];
    }
    
    [self showView];
    
    return view;
}

+ (void)networkAlerViewDismiss{
    __block UIView *view = [[UIApplication sharedApplication].delegate.window viewWithTag:AppDelegateNetworkAlertTag];
    if (view) {
        [UIView animateWithDuration:AppDelegateAlertViewDuration
                         animations:^{
                             view.frame = CGRectMake(0, -(kStatusBarHeight+kNavBarHeight), kScreenWidth, kStatusBarHeight+kNavBarHeight);
                         }
                         completion:^(BOOL finished) {
                             if (view.superview) {
                                 [view removeFromSuperview];
                                 view = nil;
                             }
                         }];
    }
}

+ (void)showView{
    UIView *view = [[UIApplication sharedApplication].delegate.window viewWithTag:AppDelegateNetworkAlertTag];
    if (view) {
        view.frame = CGRectMake(0, -kStatusBarHeight+kNavBarHeight, kScreenWidth, kStatusBarHeight+kNavBarHeight);
        [UIView animateWithDuration:AppDelegateAlertViewDuration
                         animations:^{
                             view.frame = CGRectMake(0, 0, kScreenWidth, kStatusBarHeight+kNavBarHeight);
                         }
                         completion:^(BOOL finished) {
                             [self performSelector:@selector(networkAlerViewDismiss) withObject:nil afterDelay:1];
                         }];
    }
}

@end
