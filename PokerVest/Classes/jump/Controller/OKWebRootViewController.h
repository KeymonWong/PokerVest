//
//  OKWebRootViewController.h
//  RoyaleRoulette
//
//  Created by Yonger on 2018/4/21.
//  Copyright © 2018年 PokerVest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKWebRootViewController : UIViewController

/**
 *  该参数是从接口获取到的站点域名
 *  该类实例化的时候，这个参数必须传值
 */
@property (nonatomic,copy,nonnull) NSString *urlString;

- (void)fetchDataWithAppId:(NSString *)appId;

@end
