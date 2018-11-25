//
//  UIStoryboard+LoadVCFromStoryboard.m
//  Buddy
//
//  Created by 小伴 on 16/4/19.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "UIStoryboard+LoadVCFromStoryboard.h"

@implementation UIStoryboard (LoadVCFromStoryboard)
+ (UIViewController *)stroyboardWithIdentifier:(NSString *)identifier {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:identifier bundle:[NSBundle mainBundle]];

    return [sb instantiateViewControllerWithIdentifier:identifier];
}

+ (UIViewController *)stroyboardFromMainWithIdentifier:(NSString *)identifier {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return [mainStoryboard instantiateViewControllerWithIdentifier:identifier];
}
@end
