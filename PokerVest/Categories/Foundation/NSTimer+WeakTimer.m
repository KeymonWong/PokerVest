//
//  NSTimer+WeakTimer.m
//  XiaobanParent
//
//  Created by keymon on 2018/2/4.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@implementation NSTimer (WeakTimer)

+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)(void) = [inBlock copy];
    NSTimer *timer = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(invokeTimerCallback:) userInfo:block repeats:inRepeats];
    return timer;
}

+ (NSTimer *)wk_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)(void) = [inBlock copy];
    NSTimer *timer = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(invokeTimerCallback:) userInfo:block repeats:inRepeats];
    return timer;
}

+ (void)invokeTimerCallback:(NSTimer *)inTimer;
{
    if([inTimer userInfo]) {
        void (^block)(void) = (void (^)(void))[inTimer userInfo];
        block();
    }
    
}

///!!!:@selector的方式回调未实现
//+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
//                                      target:(id)aTarget
//                                    selector:(SEL)aSelector
//                                    userInfo:(id)userInfo
//                                     repeats:(BOOL)repeats
//{
//    
//    NSTimer *timer = [self scheduledTimerWithTimeInterval:interval target:aTarget selector:aSelector userInfo:userInfo repeats:repeats];
//
//    return timer;
//}

@end
