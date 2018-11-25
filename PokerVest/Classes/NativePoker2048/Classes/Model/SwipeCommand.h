//
//  F3HQueueCommand.h
//  Tlm2048
//
//  Created by pokerVest2048 on 15/9/23.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PreDefine.h"

@interface SwipeCommand : NSObject

@property (nonatomic) MoveDirection direction;
@property (nonatomic, copy) void(^completion)(BOOL atLeastOneMove);

+ (instancetype)commandWithDirection:(MoveDirection)direction completionBlock:(void(^)(BOOL))completion;

@end
