//
//  UIStoryboard+LoadVCFromStoryboard.h
//  Buddy
//
//  Created by 小伴 on 16/4/19.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (LoadVCFromStoryboard)
/** 从非 Main 中加载，从创建的 VC 对应的 Storyboard 中加载 */
+ (UIViewController *)stroyboardWithIdentifier:(NSString *)identifier;

/** 从 Main 中加载 VC*/
+ (UIViewController *)stroyboardFromMainWithIdentifier:(NSString *)identifier;
@end
