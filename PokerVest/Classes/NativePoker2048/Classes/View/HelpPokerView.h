//
//  HelpPokerView.h
//  Tlm2048_1
//
//  Created by pokerVest2048 on 15/12/3.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpPokerView : UIButton

@property (nonatomic) NSInteger rank;
@property (nonatomic, strong) NSString *suit;

- (instancetype)initWithFrame:(CGRect)frame;

@end
