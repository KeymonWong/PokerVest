//
//  HelpCharacterView.h
//  Tlm2048_1
//
//  Created by pokerVest2048 on 15/12/4.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpCharacterView : UIView

@property (nonatomic, strong) NSString *content;
@property (nonatomic) UIColor *textColor;

- (instancetype)initWithFrame:(CGRect)frame;

@end
