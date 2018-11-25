
//
//  InlineFunc.h
//  XiaobanParent
//
//  Created by huangqimeng on 2017/12/22.
//  Copyright © 2017年 xiaoban. All rights reserved.
//

#ifndef InlineFunc_h
#define InlineFunc_h


/** 发送通知 */
CG_INLINE void
NCPostNotification(NSNotificationName name, id object, NSDictionary *userInfo) {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

/** 注册通知 */
static inline void
NCAddObserver(id observer, SEL selector, NSNotificationName name, id object) {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

/** 移除通知 */
CG_INLINE void
NCRemoveObserver(id observer, NSNotificationName name, id object) {
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
}

CG_INLINE BOOL
UserDefaultsSetObjectForKey(id object, NSString *key) {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

CG_INLINE id
UserDefaultsObjectForKey(NSString *key) {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

CG_INLINE BOOL
IsEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

/*
 @"Nil"
 @"nil"
 @"NULL"
 @"Null"
 @"null"
 @"(NULL)"
 @"(Null)"
 @"(null)"
 @"<NULL>"
 @"<Null>"
 @"<null>"
 */
CG_INLINE BOOL
IsNotEmpty(id obj) {
    return (
            obj!=nil
            && obj!=NULL
            && obj!=Nil
            && ![obj isEqual:@""]
            && ![obj isEqual:[NSNull null]]
            && ![obj isEqual:@"(NULL)"]
            && ![obj isEqual:@"(Null)"]
            && ![obj isEqual:@"(null)"]
            && ![obj isEqual:@"<NULL>"]
            && ![obj isEqual:@"<Null>"]
            && ![obj isEqual:@"<null>"]
            && ![obj isEqual:@"NULL"]
            && ![obj isEqual:@"Null"]
            && ![obj isEqual:@"null"]
            );
}

CG_INLINE id
ObjectValid(id thing) {
    if (IsEmpty(thing)) {
        return @"";
    } return thing;
}

CG_INLINE NSString *
StringFromObject(id object) {
    if (object == nil || [object isEqual:[NSNull null]]) {
        return @"";
    } else if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object respondsToSelector:@selector(stringValue)]){
        return [object stringValue];
    } else {
        return [object description];
    }
}

/** 返回 0 默认中文，1 为英文，2 为其他语言 */
CG_INLINE NSUInteger
CurrentLanguageIsChinese() {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if([currentLanguage containsString:@"en"]) {
        return 1;
    } else if ([currentLanguage containsString:@"zh-Hans"]) {
        return 0;
    }
    
    return 2;
}

/**
 *  代码设置默认语言，国际化英文和中文，如果设置的不是这两种语言，默认显示中文，此方法对SB和xib的国际化不起作用
 *
 *  @param NSLocalizedString()传入的参数
 *
 *  @return
 */
#define CURR_LANG ([[NSLocale preferredLanguages] objectAtIndex:0])
CG_INLINE NSString *
DPLocalizedString(NSString *translation_key, NSString *translation_comment) {
    NSString *s = NSLocalizedString(translation_key, translation_comment);
    NSString *language = CURR_LANG;
    if ([CURR_LANG containsString:@"en"]) {
        language = [CURR_LANG substringWithRange:NSMakeRange(0, 2)];
    }
    if ([CURR_LANG containsString:@"zh-Hans"]) {
        language = [CURR_LANG substringWithRange:NSMakeRange(0, 7)];
    }
    
    if (![language isEqual:@"en"] && ![language isEqual:@"zh-Hans"]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"];
        NSBundle *languageBundle = [NSBundle bundleWithPath:path];
        
        s = [languageBundle localizedStringForKey:translation_key value:@"" table:nil];
    }
    
    return s;
}


#endif /* InlineFunc_h */
