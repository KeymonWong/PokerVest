//
//  NSObject+PlayCAFAndVibrate.m
//  RainbowBridge
//
//  Created by FarTeen on 10/21/14.
//  Copyright (c) 2014 cmri. All rights reserved.
//

#import "NSObject+PlayCAFAndVibrate.h"
#import <AudioToolbox/AudioToolbox.h>

#define kUserDefaultShouldPlaySound     @"kUserDefaultShouldPlaySound"
#define kUserDefaultShouldVibrate       @"kUserDefaultShouldVibrate"
#define kUserDefaultShouldReceiveNoti   @"kUserDefaultShouldReceiveNoti"

@implementation NSObject (PlayCAFAndVibrate)

+ (void)didReceiveNewNotice:(NSInteger)number
{
    if (number > 0) {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultShouldVibrate] boolValue]) {
            [self vibrate];
            //return;
        }
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultShouldPlaySound] boolValue]) {
            [self playNotificationSound];
        }
    }
}

+ (void)playNotificationSound
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"noti_sound"
                                                          ofType:@"caf"];
    SystemSoundID shortSound = 0;
    // If this file is actually in the bundle...
    if (soundPath) {
        // Create a file URL with this path
        NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
        
        // Register sound file located at that URL as a system sound
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                                        &shortSound);
        AudioServicesPlaySystemSound(shortSound);
    }
}

+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
