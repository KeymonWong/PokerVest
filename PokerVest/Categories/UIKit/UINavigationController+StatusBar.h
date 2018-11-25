//
//  UINavigationController+StatusBar.h
//  Buddy
//
//  Created by 小伴 on 2016/11/27.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StatusBar)

/**
 从iOS 7开始， UIViewController有了一个新的方法：- preferredStatusBarStyle，可以让用户指定状态栏风格。但问题是这个方法只有在ViewController不包含在UINavigationController中时才起作用。大部分情况下，ViewController不会单独使用，一般都会嵌套在UINavigationController中的。因为不知道这一点，所以在很长一段时间内，我都很困惑，明明我已经在我的ViewController里写了- preferredStatusBarStyle, 却一点都不起作用。

 知道了原因，接下来就简单了。我们可以写一个UINavigationController的扩展，覆盖其默认实现，返回最上面的ViewController的preferredStatusBarStyle
 然后，在需要使用UINavigationController的时候，引入UINavigationController+StatusBar.h头文件就可以了

 补充：要使用View Controller Based Status Bar Style，你可能需要在项目的的Info.plist里增加一条记录：“View controller-based status bar appearance”，并将其值设置成YES
 */
- (UIStatusBarStyle)preferredStatusBarStyle;
@end
