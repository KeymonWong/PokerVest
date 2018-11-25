//
//  F3HQueueCommand.m
//  Tlm2048
//
//  Created by pokerVest2048 on 15/9/23.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import "SwipeCommand.h"

@implementation SwipeCommand

+ (instancetype)commandWithDirection:(MoveDirection)direction
                     completionBlock:(void (^)(BOOL))completion
{
    SwipeCommand *command = [[self class] new];
    command.direction = direction;
    command.completion = completion;
    return command;
}

@end
