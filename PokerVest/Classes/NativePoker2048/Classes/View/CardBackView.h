//
//  CardBackView.h
//  Tlm2048_1
//
//  Created by pokerVest2048 on 15/12/13.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardBackView : UIView

@property (nonatomic, strong) NSString *imageNameStr;

+ (instancetype)cardBackPosition:(CGPoint)position
                       sideWidth:(CGFloat)sideWidth
                      sideHeight:(CGFloat)sideHeight
                    cornerRadius:(CGFloat)cornerRadius;

@end
