//
//  CLLocationManager+LocationServiceEnabled.m
//  Buddy
//
//  Created by 小伴 on 16/3/1.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "CLLocationManager+LocationServiceEnabled.h"

@implementation CLLocationManager (LocationServiceEnabled)

#pragma mark -
#pragma mark 检测GPS状态
+ (BOOL)locationServiceIsEnabled {
    CLAuthorizationStatus authStatus = [CLLocationManager authorizationStatus];
    if (![CLLocationManager locationServicesEnabled]) {
        [self showAlert];
        
        return NO;
    }
    else if (authStatus == kCLAuthorizationStatusDenied || authStatus == kCLAuthorizationStatusNotDetermined || authStatus == kCLAuthorizationStatusRestricted) {
        [self showAlert];
        
        return NO;
    }
    
    return YES;
}

+ (void)showAlert {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"小伴需要您允许使用位置信息"
                                                                    message:@"请开启定位:设置 -> 隐私 -> 定位服务下的“小伴APP”定位设置."
                                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                
            }];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }];
    [alertC addAction:confirmAction];
    
    [kAppRootViewController presentViewController:alertC
                                         animated:YES
                                       completion:^{}];
}

@end
