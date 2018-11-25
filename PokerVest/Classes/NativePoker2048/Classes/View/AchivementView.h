//
//  AchivementView.h
//  Tlm2048_1
//
//  Created by pokerVest2048 on 15/12/27.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AchivementView : UIView

@property (nonatomic, strong) NSString *cardBackImageStr;
@property (nonatomic, strong) NSString *achivementDiscription;

+ (instancetype)achivementWithPosition:(CGPoint)position
                             sideWidth:(CGFloat)sideWidth
                            sideHeight:(CGFloat)sideHeight
                          cardBackImageStr:(NSString *)cardBackImageStr
                     achivementDiscription:(NSString *)achivementDescription;

@end
