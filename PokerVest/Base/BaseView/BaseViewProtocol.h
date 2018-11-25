//
//  BaseViewProtocol.h
//  XiaobanParent
//
//  Created by huangqimeng on 2017/12/22.
//  Copyright © 2017年 xiaoban. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseViewModel;

@protocol BaseViewProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;
+ (instancetype)instanceWithViewModel:(BaseViewModel *)viewModel;

- (void)setupSubview;

- (void)bindViewModel;

@end
