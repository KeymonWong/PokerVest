//
//  URLParam.h
//  XiaobanParent
//
//  Created by huangqimeng on 2018/1/26.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

/**
 * URL入参
 */

#import <Foundation/Foundation.h>

#pragma mark - URL入参

#pragma mark - 公共

extern NSString * const kBaseParam;
extern NSString * const kToken;
extern NSString * const kUid;

extern NSString * const kDirType;


#pragma mark 登录/注册模块

extern NSString * const kOpenId; ///< 微信openId
extern NSString * const kAuthCode; ///< 三方登录微信返回的 code
extern NSString * const kAuthLoginType;
extern NSString * const kPhoneNum; ///< 手机号
// !!!: 1-注册 2-找回密码
extern NSString * const kFunType; ///< 1-注册 2-找回密码
extern NSString * const kVerifyCodeSign; ///< 签名(符合加密规则)
extern NSString * const kVerifyCodeRandom; ///< 随机数(时间戳)
extern NSString * const kCheckNum; ///< 手机验证码
extern NSString * const kPwd; ///< 密码
// !!!:手机操作系统
extern NSString * const kAppopType; ///< 1-android 2-ios

// !!!:
extern NSString * const kAppType; ///< 1-家长端 2-司机端

extern NSString * const kPwdOld;
extern NSString * const kPwdNew;

extern NSString * const kKidName;
extern NSString * const kChildRelation;
extern NSString * const kProvinceCode;
extern NSString * const kCityCode;
extern NSString * const kAreaCode;
extern NSString * const ksProvinceCode;
extern NSString * const ksCityCode;
extern NSString * const ksAreaCode;

extern NSString * const kStopName;
extern NSString * const kAddrName;
extern NSString * const kSchoolName;

extern NSString * const kDetailAddr;
extern NSString * const kDetailAddrLon; ///<居住地址经度
extern NSString * const kDetailAddrLat; ///<居住地址纬度
extern NSString * const kSchoolNum; ///<学校地址唯一高德编码uid
extern NSString * const kSchoolAddr;
extern NSString * const kSchoolAddrLon; ///<学校地址经度
extern NSString * const kSchoolAddrLat; ///<学校地址纬度

extern NSString * const kPushChannelId;



#pragma mark Trip 模块

extern NSString * const kLineHaddr; ///<路线家庭地址
extern NSString * const kLineHaddrX; ///<路线家庭地址经度
extern NSString * const kLineHaddrY; ///<路线家庭地址纬度
extern NSString * const kLineSchaddr; ///<路线学校地址
extern NSString * const kLineSchaddrX; ///<路线学校地址经度
extern NSString * const kLineSchaddrY; ///<路线学校地址纬度
extern NSString * const kBaoCheFlag; ///<包车标志:1-包车 0-拼车
extern NSString * const kBeginYm; ///<开始年月
extern NSString * const kStopNums; ///<乘车人数
extern NSString * const kJoinTimes; ///<上学时间数组
extern NSString * const kLeaveTimes; ///<放学时间数组
extern NSString * const kWeekday; ///<星期信息
extern NSString * const kHappenTime; ///<时间信息
extern NSString * const kLineId; ///<路线ID

extern NSString * const kStopAddr; ///<路线家庭地址
extern NSString * const kSaddrX; ///<路线家庭地址经度
extern NSString * const kSaddrY; ///<路线家庭地址纬度

extern NSString * const kJsaX; ///<学校经度
extern NSString * const kJsaY; ///<学校纬度
extern NSString * const kJhaX; ///<站点经度
extern NSString * const kJhaY; ///<站点纬度

extern NSString * const kJourId; ///<行程ID
extern NSString * const kNeedVideoFlag; ///<需要视频标志 1-是 0-否

extern NSString * const kOrderId; ///<订单ID
extern NSString * const kThirdPayType; ///<三方支付类型
extern NSString * const kCouponIds; ///<优惠券ID
extern NSString * const kUseRemainFlag; ///<使用余额标志
extern NSString * const kBusId; ///<业务ID，即订单ID，支付那里用
extern NSString * const kTranAmt; ///<交易金额
extern NSString * const kPayId; ///<支付ID

extern NSString * const kApplyEndDt;
extern NSString * const kEndReaCode;
extern NSString * const kEndReaDesc;


#pragma mark HomePage 模块

extern NSString * const kPageNo;
extern NSString * const kPageSize;



#pragma mark 我 模块

// !!!:地址类型
extern NSString * const kAddrType; ///< 1-居住地址 2-学校地址 3-其它
extern NSString * const kAddrLon; ///< 地址经度
extern NSString * const kAddrLat; ///< 地址纬度
extern NSString * const kAddrId; ///< 地址ID

extern NSString * const kChildId; ///< 孩子ID

extern NSString * const kStopId; ///< 站点ID

extern NSString * const kPicType; ///< 1-用户头像 2-接送员头像 3-其它
extern NSString * const kPicName; ///< 图片名

extern NSString * const kChildName;
extern NSString * const kChildSex; ///< 1-男孩 2-女孩
extern NSString * const kChildSchAddr;
extern NSString * const kChildClass;
extern NSString * const kChildImgUrl;

extern NSString * const kBcName; ///<关系
extern NSString * const kMobile; ///<手机号
extern NSString * const kBcID; ///<备用联系人id
extern NSString * const kBackupContacters;


extern NSString * const kNoticeId;
extern NSString * const kNoticeType;
extern NSString * const kMessId;

extern NSString * const kDriverId;
