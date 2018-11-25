//
//  UIButton+ClickBlock.h
//  RainbowBridge
//
//  Created by FarTeen on 7/24/14.
//  Copyright (c) 2014 cmri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ClickBlock)

@property (nonatomic, copy) dispatch_block_t clickBlcok;

@end
