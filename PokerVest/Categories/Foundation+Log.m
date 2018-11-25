
#import <Foundation/Foundation.h>

///!!!:方便开发打印

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    return [self description];
}

-(NSString *)description{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        key = [NSString stringWithFormat:@"\"%@\"", key];
        
        if ([obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"\"%@\"", obj];
        }
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [obj description];
        }
        if ([obj isKindOfClass:[NSArray class]]) {
            obj = [obj description];
        }
     
        
        [str appendFormat:@"\t%@: %@,\n", key, obj];
    }];
    
    [str appendString:@"}"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
    
}


@end

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    return [self description];

}

-(NSString *)description{
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"[\n"];
    
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"\"%@\"", obj];
        }
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [obj description];
        }
        
        if ([obj isKindOfClass:[NSArray class]]) {
            obj = [obj description];
        }
        
        
        [str appendFormat:@"%@,\n", obj];
    }];
    
    [str appendString:@"]"];
    
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    
    return str;
    
}


@end
