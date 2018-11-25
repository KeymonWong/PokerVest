//
//  OKRootViewController.m
//  PokerVest
//
//  Created by keymon on 2018/11/17.
//  Copyright © 2018 KeymonWong. All rights reserved.
//

#import "OKRootViewController.h"

#import "OKJumpRequest.h"
#import <AVOSCloud/AVOSCloud.h>

#import "BaseNavigationController.h"

//原生
#import "PokerGameViewController.h"

//马甲 web 端
#import "OKWebRootViewController.h"

// Animation parameter
#define TILE_POP_START_SCALE    0.1
#define TILE_POP_MAX_SCALE      1.1
#define TILE_POP_DELAY          0.05
#define TILE_EXPAND_TIME        0.18
#define TILE_RETRACT_TIME       0.08

#define TILE_MERGE_START_SCALE  1.0
#define TILE_MERGE_EXPAND_TIME  0.08
#define TILE_MERGE_RETRACT_TIME 0.08


@interface OKRootViewController ()

@end

@implementation OKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchDataFromLeanCloud];
}

- (void)fetchDataFromLeanCloud {
    //获取对象
    //每个被成功保存在云端的对象会有一个唯一的 Id 标识 objectId，因此获取对象的最基本的方法就是根据 objectId 来查询：
    AVQuery *query = [AVQuery queryWithClassName:@"ToDoMoney"];
    [query getObjectInBackgroundWithId:@"5bf96fd1fb4ffe2c75aa53e6" block:^(AVObject *object, NSError *error) {
        NSLog(@"object：%@", [object objectForKey:@"poker_appId"]);
        
        NSString *appId = [object objectForKey:@"poker_appId"];
        if ([appId isEqualToString:@"app1"]) {
//            RoyaleRootViewController *rootViewController = [[RoyaleRootViewController alloc] init];
//            rootViewController.urlString = [NSString stringWithFormat:@"%@",[[objects objectAtIndex:0] objectForKey:@"Url"]];
//            BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:rootViewController];
//            nav.orientationMask = UIInterfaceOrientationMaskAll;
//            [self addChildViewController:nav];
//            [self.view addSubview:nav.view];

//            [self jumpWithAppId:appId];
            
            OKWebRootViewController *webVC = [[OKWebRootViewController alloc] init];
            BaseNavigationController *webNavVC = [[BaseNavigationController alloc] initWithRootViewController:webVC];
            [webNavVC willMoveToParentViewController:self];
            [self addChildViewController:webNavVC];
            [self.view addSubview:webNavVC.view];
            
            [webVC fetchDataWithAppId:appId];
        }
        else {
            
        }
        
        if (!IsNotEmpty(appId)) {
            PokerGameViewController *gameVC = [[PokerGameViewController alloc] init];
            [gameVC willMoveToParentViewController:self];
            [self addChildViewController:gameVC];
            [self.view addSubview:gameVC.view];
        }
    }];
}

- (void)jumpWithAppId:(NSString *)appId {
    OKJumpRequest *req = [OKJumpRequest requestWithSuccessBlock:^(NSString *errCode, NSDictionary *responseDict, id model) {
        DLog(@"%@", responseDict);
    } failureBlock:^(NSError *error) {
        
    }];
    req.app_id = appId;
    req.showHUD = YES;
    [req startRequest];
}

@end
