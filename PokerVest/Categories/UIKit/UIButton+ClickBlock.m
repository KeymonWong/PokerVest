//
//  UIButton+ClickBlock.m
//  RainbowBridge
//
//  Created by FarTeen on 7/24/14.
//  Copyright (c) 2014 cmri. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>

const char *FTButtonClickTag = "FTButtonClickTag";

@implementation UIButton (ClickBlock)

- (void)setClickBlcok:(dispatch_block_t)clickBlcok
{
    objc_setAssociatedObject(self, FTButtonClickTag, clickBlcok, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (dispatch_block_t)clickBlcok
{
    return objc_getAssociatedObject(self, FTButtonClickTag);
}

- (void)buttonTouchUpInsideAction:(UIButton *)btn
{
    if (self.clickBlcok) {
        self.clickBlcok();
    }
}


@end
