//
//  BaseRequest.h
//  Buddy
//
//  Created by 小伴 on 2016/12/14.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestCallback.h"

extern NSString * const NetworkDomain; ///< 请求网络域名,即你后台服务器的域名,譬如：https://www.baidu.com，后面不拼接任何路径、参数的，这样子的就不是域名https://www.baidu.com/info

///< 数据传输采用的加密算法.
typedef NS_ENUM(NSInteger, EncryptAlgorithm) {
    EncryptAlgorithmNone = 0,
    EncryptAlgorithmRSA = 1,     /* Rsa Encrypt With Public Key */
    EncryptAlgorithmAES = 2,     /* AES Encrypt With Session Key */
    EncryptAlgorithmBase64 = 3,  /* Base64 Encode/Decode */
};

///< HTTP Request method.
typedef NS_ENUM(NSInteger, RequestMethod) {
    RequestMethodGET = 0,
    RequestMethodPOST
};

///< Request serializer type.
/**
 * AFHTTPRequestSerializer:
 
   POST http://example.com/
   Content-Type: application/x-www-form-urlencoded
   foo=bar&baz[]=1&baz[]=2&baz[]=3
 
 * AFJSONRequestSerializer:
 
   POST http://example.com/
   Content-Type: application/json
   {"foo": "bar", "baz": [1,2,3]}
 */
typedef NS_ENUM(NSInteger, RequestSerializerType) {
    RequestSerializerTypeHTTP = 0, ///<url格式的参数编码
    RequestSerializerTypeJSON ///<json格式的url参数编码
};

///< Response serializer type, which determines response serialization process and
///  the type of `responseObject`.
typedef NS_ENUM(NSInteger, ResponseSerializerType) {
    ResponseSerializerTypeHTTP = 0, ///< NSData
    ResponseSerializerTypeJSON, ///< JSON
    ResponseSerializerTypeXMLParser ///< NSXMLParser
};


@interface BaseRequest : NSObject
@property (nonatomic, assign) BOOL showHUD;

@property (nonatomic, weak) id<BaseRequestDelegate> delegate;

@property (nonatomic, copy) AFConstructingBodyBlock constructingBodyBlock;
@property (nonatomic, copy) AFURLSessionTaskProgressBlock resumableDownloadProgressBlock;
@property (nonatomic, copy) AFURLSessionTaskProgressBlock uploadProgress;

@property (nonatomic, copy) RequestSuccessBlock successBlock;
@property (nonatomic, copy) RequestFailureBlock failureBlock;

- (instancetype)initWithSuccessBlock:(RequestSuccessBlock)successBlock
                        failureBlock:(RequestFailureBlock)failureBlock;
+ (instancetype)requestWithSuccessBlock:(RequestSuccessBlock)successBlock
                           failureBlock:(RequestFailureBlock)failureBlock;

- (void)startCompletionBlockWithSuccess:(RequestSuccessBlock)success
                                failure:(RequestFailureBlock)failure;

/**
 带进度的图片上传

 @param success 成功回调
 @param failure 失败回调
 @param uploadProgress 进度回调
 */
- (void)startUploadTaskWithSuccess:(RequestSuccessBlock)success
                           failure:(RequestFailureBlock)failure
                    uploadProgress:(AFURLSessionTaskProgressBlock)uploadProgress;

/**
 * @brief 公共方法，开始请求，不管是使用 block 回调还是 delegate 回调，都要调用此方法
 */
- (void)startRequest;

/**
 * @brief 请求超时时间间隔
 *
 * @warning 子类按需重写
 */
- (NSTimeInterval)requestTimeoutInterval;

/**
 * @brief 请求参数
 *
 * @warning 子类必须重写
 */
- (NSDictionary *)requestArguments;

/**
 * @brief 请求URL路径
 *
 * @warning 子类必须重写
 */
- (NSString *)requestURLPath;

/**
 * @brief 请求方式 GET or POST
 *
 * @warning 子类按需重写
 */
- (RequestMethod)requestMethod; ///< 默认 GET 请求

/**
 * @brief 请求序列类型
 *
 * @warning 子类按需重写
 */
- (RequestSerializerType)requestSerializerType;

/**
 * @brief 响应序列类型
 *
 * @warning 子类按需重写
 */
- (ResponseSerializerType)responseSerializerType;

/**
 * @brief 设置请求头
 *
 * @warning 子类按需重写
 */
- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary; ///< Additional HTTP request header field. HTTP 请求头配置，按需重写

/**
 * 处理请求返回的数据，字典转模型，利用 Mantle 或 YYModel
 *
 * @param data 需要的数据
 * @param resCode 后台返回的错误码（代表各种情况）
 *
 * @warning 子类必须重写
 */
- (void)handleData:(id)data errCode:(NSString *)resCode;

@end
