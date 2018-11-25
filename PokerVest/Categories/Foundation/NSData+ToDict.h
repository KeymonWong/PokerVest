//
//  NSData+ToDict.h
//  Buddy
//
//  Created by 小伴 on 16/10/26.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ToDict)
/**
 * 二进制数据转换为字典
 * 使用：NSDictionary *dict = [NSData dataToDictionaryWithData:传过来的data];
 */
+ (NSDictionary *)dataToDictionaryWithData:(NSData *)data;
@end
