//
//  OBHelper.m
//  Buddy
//
//  Created by 小伴 on 16/6/4.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "OBHelper.h"

@implementation OBHelper

+ (BOOL)helpJudgeCurrentLanguage {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if([currentLanguage containsString:@"en"]) {
        return NO;
    } else if ([currentLanguage containsString:@"zh-Hans"]) {
        return YES;
    }

    return nil;
}

@end
