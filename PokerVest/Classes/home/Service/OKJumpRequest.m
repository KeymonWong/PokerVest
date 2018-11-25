//
//  OKJumpRequest.m
//  PokerVest
//
//  Created by keymon on 2018/11/17.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "OKJumpRequest.h"

@implementation OKJumpRequest

- (NSString *)requestURLPath {
    return @"/lottery/back/api.php?";
}

- (NSDictionary *)requestArguments {
    return @{
             @"app_id": _app_id
             };
}

- (void)handleData:(id)data errCode:(NSString *)resCode {
    DLog(@"handleData:%@", data);
    NSDictionary *dict = (NSDictionary *)data;
    
    self.successBlock(resCode, dict, nil);
}

@end
