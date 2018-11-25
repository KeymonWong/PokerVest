//
//  FinalPokerGameViewController.h
//  Tlm2048_1
//
//  Created by pokerVest2048 on 15/12/1.
//  Copyright © 2015年 pokerVest2048. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"

@protocol F3HPokerGameProtocol <NSObject>

- (void)gameFinishedWithVictory:(BOOL)didWin score:(NSInteger)score;

@end

@protocol CardBackProtocol <NSObject>

- (void)changeCardBack:(NSString *)cardBackName;

@end

@interface PokerGameViewController : UIViewController <GKGameCenterControllerDelegate>

- (void)resetGame;

@property (nonatomic, weak) id<F3HPokerGameProtocol>delegate;
@property (strong, nonatomic) NSString *cardBackImageStr;


@end
