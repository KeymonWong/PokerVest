//
//  NSTimer+WeakTimer.h
//  XiaobanParent
//
//  Created by keymon on 2018/2/4.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @header     WeakTimer
 @abstract   NSTimer's category
 @discussion NSTimer会强引用target而导致有可能出现循环引用的问题，该Category主要解决循环引用
 并简单的实现自释放功能，一个对象的timer属性或变量并不需要考虑在合适的时机调用invalidate
 timer会在该对象销毁的时候自动invalidate。
 @author     keymon
 */

/**
 打破timer的循环引用,timer都会对它的target进行retain,我们需要小心对待
 这个target的生命周期问题,尤其是重复性的timer,timer不是一种实时的机制,
 会存在延迟,而且延迟的程度跟当前线程的执行情况有关。
 */
@interface NSTimer (WeakTimer)

///!!!:默认已经加入
+ (NSTimer *)wk_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;

///!!!:需要手动加入runloop
+ (NSTimer *)wk_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;

@end
