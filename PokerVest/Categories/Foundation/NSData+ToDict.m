//
//  NSData+ToDict.m
//  Buddy
//
//  Created by 小伴 on 16/10/26.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "NSData+ToDict.h"

@implementation NSData (ToDict)

+ (NSDictionary *)dataToDictionaryWithData:(NSData *)data {
    NSString *str = nil;
    NSDictionary *dict = nil;

    if (data) {
        str = [[NSString alloc] initWithBytes:data.bytes
                                       length:data.length
                                     encoding:NSUTF8StringEncoding];
    }
    if (str != nil) {
        //标准字符串类型的json格式@"{\"status\":\"1\",\"url\":\"http://www.baidu.com\"}"
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError * __autoreleasing err;
        dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                               options:NSJSONReadingAllowFragments
                                                 error:&err];
        if(err) {
            DLog(@"json解析失败：%@",err);
            return nil;
        }

        return dict;
    }

    return nil;
}

@end
