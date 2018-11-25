//
//  UIViewController+ShowVC.m
//  OA-iOS-Client
//
//  Created by FarTeen on 10/31/14.
//  Copyright (c) 2014 CMCC. All rights reserved.
//

#import "UIViewController+ShowVC.h"

#import "BaseNavigationController.h"

@implementation UIViewController (ShowVC)

+ (void)showMainRootContainerViewControllerAnimated:(BOOL)animated {
//    OBMainRootContainerViewController *rootContainerVC = [[OBMainRootContainerViewController alloc] init];
//    BaseNavigationController *rootContainerNavC = [[BaseNavigationController alloc] initWithRootViewController:rootContainerVC];
//
//    [self setMainViewController:rootContainerNavC animated:animated];
}

+ (void)showMainTabBarAnimated:(BOOL)animated
{
//    OBTabBarController *mainVc = [[OBTabBarController alloc] init];
//
//    CRNavigationController *mainNavi = [[CRNavigationController alloc] initWithRootViewController:mainVc];

    //手势返回更新为MLBlackTransition
    //[MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypePan];

//    if (childId == 0) {
//        OBCompleteInfoViewController *cvc = (OBCompleteInfoViewController *)[UIStoryboard stroyboardWithIdentifier:@"OBCompleteInfoViewController"];
//
//        [mainNavi pushViewController:cvc animated:YES];

        /* 16-4-22注释掉不要了
        //如果你的系统大于等于7.0
        if (floor(NSFoundationVersionNumber) >= NSFoundationVersionNumber_iOS_7_1)
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                                     message:message
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
            paragraphStyle.alignment = NSTextAlignmentLeft;
            //行间距
            paragraphStyle.lineSpacing = 5.0;

            NSDictionary * attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:13.5], NSParagraphStyleAttributeName : paragraphStyle};
            NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:message];
            [attributedTitle addAttributes:attributes range:NSMakeRange(0, message.length)];
            [alertController setValue:attributedTitle forKey:@"attributedMessage"];//attributedTitle\attributedMessage
            UIAlertAction *defaultAction2 = [UIAlertAction actionWithTitle:@"知道了"
                                                                     style: UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction *action) {
                                                                       [alertController dismissViewControllerAnimated:YES completion:nil];
                                                                       if (childId == 0) {
                                                                           OBCompleteInfoViewController *cvc = (OBCompleteInfoViewController *)[UIStoryboard stroyboardWithIdentifier:@"OBCompleteInfoViewController"];

                                                                           [mainNavi pushViewController:cvc animated:YES];
                                                                       }                                                                    }];
            [alertController addAction:defaultAction2];

            UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
            DLog(@"%@-%@", rootViewController,
                 [[UIApplication sharedApplication] windows]);
//            [rootViewController becomeFirstResponder];
#warning 加上此句解决莫名弹出键盘的bug（16-4-22修改添加）
            [rootViewController.view endEditing:YES];
            [rootViewController presentViewController:alertController animated: YES completion: nil];
        }*/
//    }


    /*UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    XNLeftViewController *settingTBC = (XNLeftViewController *)[UIStoryboard mainViewControllerWithIdentifier:@"XNLeftViewController"];
    XMMainViewController *mainVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"XMMainViewController"];
    CRSliderViewController *sideVC = [[CRSliderViewController alloc] init];
    sideVC.MainVC = mainVC;
    sideVC.LeftVC = settingTBC;
    sideVC.LeftSContentOffset = 230;
    sideVC.LeftContentViewSContentOffset = 90;
    sideVC.LeftSContentScale=1;
    sideVC.LeftSJudgeOffset = 160;
    sideVC.changeLeftView = ^(CGFloat sca, CGFloat transX)
    {
        CGAffineTransform ltransS = CGAffineTransformMakeScale(sca, sca);
        CGAffineTransform ltransT = CGAffineTransformMakeTranslation(transX, 0);
        CGAffineTransform lconT = CGAffineTransformConcat(ltransT, ltransS);
        settingTBC.view.transform = lconT;
    };
    [sideVC closeSideBarWithAnimate:NO complete:^(BOOL finished) {
        
    }];
    //    [UIViewController validatePanPackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
    //手势返回更新为MLBlackTransition
    [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypePan];*/
}

+ (void)showCompleteInfoViewControllerAnimated:(BOOL)animated {
//    OBCompleteInfoViewController *cvc = (OBCompleteInfoViewController *)[UIStoryboard stroyboardWithIdentifier:@"OBCompleteInfoViewController"];
//    BaseNavigationController *mainNavi = [[BaseNavigationController alloc] initWithRootViewController:cvc];
//
//    [self setMainViewController:mainNavi animated:animated];
}

+ (void)showLoginControllerAnimated:(BOOL)animated {
//    XBPLoginMethodViewController *loginMethodVC = (XBPLoginMethodViewController *)[UIStoryboard stroyboardWithIdentifier:@"XBPLoginMethodViewController"];
//    BaseNavigationController *loginMethodNC = [[BaseNavigationController alloc] initWithRootViewController:loginMethodVC];
//
////    XBPLoginViewController *loginVC = (XBPLoginViewController *)[UIStoryboard stroyboardWithIdentifier:@"XBPLoginViewController"];
////    BaseNavigationController *loginNC = [[BaseNavigationController alloc] initWithRootViewController:loginVC];
//
//    [self setMainViewController:loginMethodNC animated:animated];
}

+ (void)showLoginMethodControllerAnimated:(BOOL)animated {
//    XBPLoginMethodViewController *loginMethodVC = (XBPLoginMethodViewController *)[UIStoryboard stroyboardWithIdentifier:@"XBPLoginMethodViewController"];
//    BaseNavigationController *loginMethodNC = [[BaseNavigationController alloc] initWithRootViewController:loginMethodVC];
//
//    [self setMainViewController:loginMethodNC animated:animated];
}

+ (void)showNextLoginControllerAnimated:(BOOL)animated
{
//    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    OBNextLoginViewController *nextLoginVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OBNextLoginViewController"];
//    CRNavigationController *mainNavi = [[CRNavigationController alloc] initWithRootViewController:nextLoginVC];
//    [self setMainViewController:mainNavi animated:NO];
}

+ (void)setMainViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    if (animated) {
//        UIView *snapShot = nil;
//        if (iOS_Version >= 7.0) {
//            snapShot = [[UIApplication sharedApplication].delegate.window snapshotViewAfterScreenUpdates:YES];
//        } else {
//            snapShot = [[UIImageView alloc] initWithFrame:kScreenRect];
//            [(UIImageView *)snapShot setImage:[[UIApplication sharedApplication].delegate.window snapshotImage]];
//        }
//        [viewController.view addSubview:snapShot];
//        [UIApplication sharedApplication].delegate.window.rootViewController = viewController;
//        [UIView animateWithDuration:0.15 animations:^{
//            snapShot.layer.opacity = 0;
//            snapShot.layer.transform = CATransform3DMakeScale(1., 1., 1.);
//        } completion:^(BOOL finished) {
//            [snapShot removeFromSuperview];
//        }];
//    } else {
//        [UIApplication sharedApplication].delegate.window.rootViewController = viewController;
//    }
}

@end
