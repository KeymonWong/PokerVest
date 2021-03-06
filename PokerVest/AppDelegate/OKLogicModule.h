//
//  OKLogicModule.h
//  PokerVest
//
//  Created by keymon on 2018/11/24.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VDConfigEngine.h"

NS_ASSUME_NONNULL_BEGIN

@interface OKLogicModule : NSObject<VDConfigEngineProtocol>
- (void)configRootViewController;
@end

NS_ASSUME_NONNULL_END
