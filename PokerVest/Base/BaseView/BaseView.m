//
//  BaseView.m
//  XiaobanParent
//
//  Created by huangqimeng on 2017/12/22.
//  Copyright © 2017年 xiaoban. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
        [self bindViewModel];
    }
    return self;
}

- (instancetype)initWithViewModel:(BaseViewModel *)viewModel {
    if (self = [super initWithFrame:self.bounds]) {
    }
    return self;
}

+ (instancetype)instanceWithViewModel:(BaseViewModel *)viewModel {
    return [[self alloc] initWithViewModel:viewModel];
}

- (void)bindViewModel {
}


- (void)setupSubview {
}

@end
