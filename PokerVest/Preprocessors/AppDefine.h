
//
//  AppDefine.h
//  自定义TabBar
//
//  Created by 小伴 on 16/7/21.
//  Copyright © 2016年 huangqimeng. All rights reserved.
//
//  PS: App 项目用到的参数定义 -> URL 的入参、通知名字、SDK 的 AppKey 等

#ifndef AppDefine_h
#define AppDefine_h

#ifdef __OBJC__
    #import <Foundation/Foundation.h> //下面要是用到 Foundation 库就要包括
#endif

#define kAppBgColor [UIColor colorWithHexString:@"#f3f3f3"]

#define kSeparatedLineColor [UIColor colorWithHexString:@"#dfdfdf"]

#define kFirstUseDate       @"kFirstUseDate"
#define kIsNotFirstUse      @"kIsNotFirstUse"
#define kFirstLaunch        @"kFirstLaunch"
#define kIsLogin            @"kIsLogin"
#define kIsFirstInstallToLoadCover @"kIsFirstInstallToLoadCover"

static NSString * const HQMTabBarItemDidClickRepeatNotification = @"HQMTabBarItemDidClickRepeatNotification";


/** 微信支付的通知 */
#define WECHAT_PAYRESULT_NOTIFICATION @"weChat_payResult_notification"
#define kWXPaySuccess                 @"weChat_payResult_isSuccess"
#define kWXPayFail                    @"weChat_payResult_isFailed"

//商户号，填写商户对应参数（客户给）
#define kWXMCH_ID @"这里填写商户号，客户会给你"
//商户API密钥，填写相应参数（客户给）
#define kWXPARTNER_ID @"o1jVjTBmJcmwZpHDUubqRUV6GEwoIa4v"
//支付结果回调页面（后台会给你）
#define kWECHAT_NOTIFY_URL @"这里填写后台给你的微信支付的后台接口网址"

///< url scheme
#define kAliPayURLScheme @"xbparentAlipayScheme"

/** 支付宝支付的通知 */
#define ALI_PAY_RESULT_NOTIFICATION  @"Ali_pay_result_notification"
#define ALIPAY_SUCCESSED  @"Ali_pay_isSuccessed"
#define ALIPAY_FAILED  @"Ali_pay_isFailed"



// TODO: Relpace this with itc application identifier
// 这是 APP 在 Appstore 上的唯一标识
#define kOnItunesConnectAppID   @""

#ifdef DEBUG //处于开发阶段

//#define NULLSAFE_ENABLED 0

    /** 测试时用此 */
    #define kApplicationRongId       @""
    #define kApplicationRongKefuID   @""

    #define kTalkingDataAppID   @""

    #define kGeTuiAppID         @""
    #define kGeTuiAppKey        @""
    #define kGeTuiAppSecret     @""
    #define kGeTuiMasterSecret  @""

#else //处于发布阶段

//#define NULLSAFE_ENABLED 1

    /** 正式发布时用此 */
    #define kApplicationRongId       @""
    #define kApplicationRongKefuID   @""

    #define kTalkingDataAppID   @""

    #define kGeTuiAppID         @""
    #define kGeTuiAppKey        @""
    #define kGeTuiAppSecret     @""
    #define kGeTuiMasterSecret  @""

#endif

///<小程序原始 id
#define kMiniPragramOrginId      @""
#define kUMengAppTrackAppKey     @""
#define kApplicationId           @""
#define kApplicationChannelId    @""
#define kApplicationMapId        @""

#define kShareWeiboRedirectUrl   @"https://api.weibo.com/oauth2/default.html"
#define kWeixinAppId             @""
#define kWeixinAppSecret         @""
#define kTencentAppId            @""
#define kWeiboAppKey             @""

// ---------------- 分享文字 -------------

//邀请有奖
#define kInviteForAwardTitle     @"加入小伴-专享定制化家校接送服务"
#define kInviteForAwardContent   @"注册即领百元红包"

// ---------------- 分享URL -------------

#define kShareSettingURL         @"http://a.app.qq.com/o/simple.jsp?pkgname=com.xiaoban.mobile"


// ---------------- 关于小伴 -------------
#define kAboutXBStoryURL    @"http://www.xiao-ban.cc/index.php/Api/Web/XBStory"

#define kAboutXBFounderURL  @"http://www.xiao-ban.cc/index.php/Api/Web/XBFounder"

// ---------------- 常见问题 -------------
#ifdef DEBUG

    #define kRegisterFaqURL           @"http://static.temp.xiaoban.mobi/register.html"

    #define kUserWithdrawProblemURL   @"http://static.temp.xiaoban.mobi/user_problem.html"
    #define kCouponRuleURL            @"http://static.temp.xiaoban.mobi/coupon_problem.html"
    #define kEstPriceFaqURL           @"http://static.temp.xiaoban.mobi/expense_explanation.html"

    ///<邀请有奖
    #define kInviteForAwardURL     @"https://dev.services.xiaoban.mobi/shuttle/static/page/invitedUser?invitedUserId="
#else

    ///<邀请有奖
    #define kInviteForAwardURL     @"https://cloud-services.xiaoban.mobi/shuttle/static/page/invitedUser?invitedUserId="

    #define kRegisterFaqURL          @"http://static.temp.xiaoban.mobi/register.html"

    #define kUserWithdrawProblemURL  @"http://static.temp.xiaoban.mobi/user_problem.html"
    #define kCouponRuleURL           @"http://static.temp.xiaoban.mobi/coupon_problem.html"
    #define kEstPriceFaqURL          @"http://static.temp.xiaoban.mobi/expense_explanation.html"


    #define kShuttleQuestionURL @"http://static.temp.xiaoban.mobi/faq_all.html"

    #define kShuttleServiceURL  @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_shuttle_service"
    #define kShuttleSafetyURL   @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_shuttle_safety"
    #define kShuttleCostURL     @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_shuttle_cost"

    #define kMutualDefURL       @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_mutual_def"
    #define kMutualUsageURL     @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_mutual_usage"
    #define kMutualSafetyURL    @"http://www.xiao-ban.cc/index.php?s=/Api/Web/FAQ_mutual_safety"

    #define kAboutXBTechURL     @"http://static.temp.xiaoban.mobi/index.php/Api/Web/XBTech"

#endif

// ---------------- 用户协议 -------------
#define kXBDaijiePolicyURL   @"http://static.temp.xiaoban.mobi/XBShuttleProtocol.html"
#define kXBUserPolicyURL     @"http://static.temp.xiaoban.mobi/UserPolicy.html"


#define kOldLocaleAppVersion @"kOldLocaleAppVersion"

#define kAppUserName @"kAppPhoneNum"
#define kAppUserPwd @"kAppUserPwd" ///<加密后的密码
#define kRyToken @"kRyToken" ///< 融云 token

#define kErrorMsg @"messageCn" ///<返回错误码信息提示

#define kSuccessErrCode @"0000" ///<请求成功的错误码，代表请求成功

#define ColorFromSixteen(s,al)  ([UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:al])

#define IsPortrait   [NSObject isOrientationPortrait]

#endif /* AppDefine_h */
