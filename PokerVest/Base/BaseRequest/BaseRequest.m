//
//  HQMBaseRequest.m
//  Buddy
//
//  Created by 小伴 on 2016/12/14.
//  Copyright © 2016年 huang qimeng. All rights reserved.
//

#import "BaseRequest.h"
#import "Reachability.h"

#import "UIViewController+ShowVC.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
    #import <AFNetworking/AFNetworking.h>
#else
    #import "AFNetworking.h"
#endif

///< SSL证书名称，仅支持cer格式。本 Demo 没有导入HTTPS证书，如果有需要请导入自己的，HTTPS 证书验证的代码是正确的
#define kCertificateName @"httpsServerAuth"

#ifdef DEBUG //处于开发测试阶段

NSString * const NetworkDomain = @"http://app.11qdcp.com";

///< 关闭https SSL 验证
#define kOpenHttpsAuth NO

#else //处于发布正式阶段

NSString * const NetworkDomain = @"http://app.11qdcp.com";

// FIXME: < 开启https SSL 验证，目前后台还没有配置证书，暂时关闭
#define kOpenHttpsAuth NO

#endif

@interface BaseRequest ()
{
    NSInteger _page;
    NSString *_url;
    NSString *_timestamp;
    NSTimeInterval _timeoutInterval;
    BOOL _networkIsError;
    AFHTTPSessionManager *_manager;
    NSURLSessionTask *_requestTask;
    dispatch_queue_t _processingQueue;
}

@end

@implementation BaseRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initHttpSessionManager];
    }
    return self;
}

- (void)initHttpSessionManager {
    _networkIsError = NO;
    _page = -1;
    _showHUD = NO;
    _timeoutInterval = 40.;
    _manager = [AFHTTPSessionManager manager];

    //_processingQueue = dispatch_group_create();

    //默认响应返回 json 格式
    switch ([self responseSerializerType]) {
        case ResponseSerializerTypeHTTP: {
            _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        } break;
        case ResponseSerializerTypeJSON: {
            _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        } break;
        case ResponseSerializerTypeXMLParser: {
            _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        } break;
    }
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/html",@"application/xml",@"text/plain,",@"text/xml", nil];
    
    if (kOpenHttpsAuth) {
        [_manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    
//    _manager.completionGroup = _processingQueue;
}

- (instancetype)initWithSuccessBlock:(RequestSuccessBlock)successBlock
                        failureBlock:(RequestFailureBlock)failureBlock
{
    if (self = [self init]) {
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
        self.uploadProgress = nil;
    }
    return self;
}

+ (instancetype)requestWithSuccessBlock:(RequestSuccessBlock)successBlock failureBlock:(RequestFailureBlock)failureBlock {
    return [[[self class] alloc] initWithSuccessBlock:successBlock failureBlock:failureBlock];
}

- (void)startCompletionBlockWithSuccess:(RequestSuccessBlock)success failure:(RequestFailureBlock)failure {
    self.successBlock = success;
    self.failureBlock = failure;
    self.uploadProgress = nil;
}


- (void)startUploadTaskWithSuccess:(RequestSuccessBlock)success
                           failure:(RequestFailureBlock)failure
                    uploadProgress:(AFURLSessionTaskProgressBlock)uploadProgress
{
    self.successBlock = success;
    self.failureBlock = failure;
    self.uploadProgress = uploadProgress;
}

- (void)startRequest {
    _networkIsError = [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus] == NotReachable ? YES : NO;
    if (_networkIsError) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD showErrorStatus:NSLocalizedString(@"网络连接暂时不可用", @"")];
        });
        return;
    }
    
    if (self.showHUD) {
        [MBProgressHUD showHUD];
    }

    //拼接请求路径
    [self constructURL];

    //AFN 已经很强大了，不用手动拼接 URL 参数，AFN 可以帮你处理好 url 入参
    [self constructSessionTask];
}

- (void)constructURL {
    _url = [NSString stringWithFormat:@"%@%@", NetworkDomain, [self requestURLPath]];
}

- (void)constructSessionTask {
    NSError * __autoreleasing requestSerializationError = nil;
    
    _requestTask = [self sessionTaskForError:&requestSerializationError];

    [_requestTask resume];
}

#pragma mark - 此处可以配置所有请求都需要的共同的参数
- (NSURLSessionTask *)sessionTaskForError:(NSError *__autoreleasing *)error {
    RequestMethod method = [self requestMethod];

    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:[self requestArguments]];

    //此处可以配置所有请求都需要的共同的参数，比如 token
//    NSString *token = @"";
//    if (VALID_STRING([OBGlobal global].userInfo.token)) {
//        token = [OBGlobal global].userInfo.token;
//    }
//    [params setObject:token forKey:kRequestToken];

    AFConstructingBodyBlock constructingBodyBlock = [self constructingBodyBlock];
    AFHTTPRequestSerializer *requestSerializer = [self requestSerializer];

    switch (method) {
        case RequestMethodGET: {
            return [self dataTaskWithHTTPMethod:@"GET"
                              requestSerializer:requestSerializer
                                      URLString:_url
                                     parameters:params
                                 uploadProgress:nil
                               downloadProgress:nil
                      constructingBodyWithBlock:nil
                                          error:error];
        } break;
        case RequestMethodPOST: {
            return [self dataTaskWithHTTPMethod:@"POST"
                              requestSerializer:requestSerializer
                                      URLString:_url
                                     parameters:params
                                 uploadProgress:self.uploadProgress
                               downloadProgress:nil
                      constructingBodyWithBlock:constructingBodyBlock
                                          error:error];
        } break;
    }
}

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                               requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                                       URLString:(NSString *)URLString
                                      parameters:(id)param
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                       constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData>formData))block
                                           error:(NSError * _Nullable __autoreleasing *)error
{
    NSMutableURLRequest *request = nil;

    if (block) {
        request = [requestSerializer multipartFormRequestWithMethod:method URLString:URLString parameters:param constructingBodyWithBlock:block error:error];
    } else {
        request = [requestSerializer requestWithMethod:method URLString:URLString parameters:param error:error];
    }

    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [_manager dataTaskWithRequest:request uploadProgress:uploadProgress downloadProgress:downloadProgress completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        //AFN 返回的数据responseObject已经是字典了，不必再用NSJSONSerialization解析了
        [self handleRequestResult:dataTask response:response responseObject:responseObject error:error];
    }];

    if ([method isEqualToString:@"GET"]) {
        DLog(@"GET-->url:%@", dataTask.currentRequest.URL.absoluteString);
    } else {
        DLog(@"POST-->url:%@", dataTask.currentRequest.URL.absoluteString);
    }

    return dataTask;
}

- (AFHTTPRequestSerializer *)requestSerializer {
    AFHTTPRequestSerializer *requestSerializer = nil;
    switch ([self requestSerializerType]) {
        case RequestSerializerTypeHTTP: {
            requestSerializer = [AFHTTPRequestSerializer serializer];
        } break;
        case RequestSerializerTypeJSON: {
            requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
        } break;
    }

    requestSerializer.timeoutInterval = [self requestTimeoutInterval];
    requestSerializer.allowsCellularAccess = [self allowsCellularAccess];

    //api needs to add custom value to HTTPHeaderField
    NSDictionary<NSString *, NSString *> *headerFieldValueDict = [self requestHeaderFieldValueDictionary];
    if (headerFieldValueDict != nil) {
        for (NSString *key in headerFieldValueDict.allKeys) {
            NSString *value = headerFieldValueDict[key];
            [requestSerializer setValue:value forHTTPHeaderField:key];
        }
    }

    return requestSerializer;
}

- (void)requestDidFailWithRequest:(NSURLRequest *)request error:(NSError *)error {
//    DLog(@"Request %@ failed, status code = %ld, error = %@",
//           NSStringFromClass([request class]), (long)request.responseStatusCode, error.localizedDescription);
}

- (void)handleRequestResult:(NSURLSessionDataTask *)dataTask
                   response:(NSURLResponse *)response
             responseObject:(id)responseObject
                      error:(NSError *)error
{
    /* Process Network Error */
    if (error) {
        NSString *errString = error.localizedFailureReason;
        DLog(@"+_+_+%@+_+_+%@", error, errString);

        if (error.code == -1001) {//请求超时情况的处理
            [MBProgressHUD showErrorStatus:@"请求超时"];
            
            NSData *data = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
            errString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            DLog(@"_+_+%@+_+%@", data, errString);
        }
        
        DLog(@"Request Failed with Error:%@,%@", error, error.userInfo);
        DLog(@"response.statusCode=+=+:%@", [NSHTTPURLResponse localizedStringForStatusCode:((NSHTTPURLResponse *)response).statusCode]);
        
        _showHUD = YES;
        if (self.failureBlock) {
            self.failureBlock(error);
        }

        if (_delegate && [_delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
            [_delegate requestDidFailWithError:error];
        }

        if (_showHUD) {
            [MBProgressHUD showErrorStatus:@"网络错误啦"];
        } else {
            [MBProgressHUD hideHUD];
        }
        _showHUD = NO;
        
        return;
    }
    
    /* Process Response Error */
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode != 200) {
        NSLog(@"HTTP Bad Response: %ld", (long)httpResponse.statusCode);
        
        NSInteger statusCode = httpResponse.statusCode;
        NSString *status_str = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
        
///< 当前处于开发模式、模拟器环境下,才显示 HTTP 返回的状态码,方便调试
#ifdef DEBUG //处于开发阶段
    #if TARGET_IPHONE_SIMULATOR
        //iPhone Simulator
        [MBProgressHUD showTip:[NSString stringWithFormat:@"HTTP状态码:%ld-->状态码描述：%@", statusCode, status_str] toView:nil stay:2];
    #endif
#endif
        
        if (self.failureBlock) {
            self.failureBlock(error);
        }
        
        if (_delegate && [_delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
            [_delegate requestDidFailWithError:error];
        }
        
        return;
    }
    
    /* Decrypt Dict */
    ///< 可以修改，根据自己服务端返回的 json 数据格式修改
//    id json = [self preHandleData:responseObject error:error];
    NSDictionary *json = (NSDictionary *)responseObject;
    if (json) {
        NSDictionary *dict = [self decryptJSONObject:json usingAlgorithm:EncryptAlgorithmBase64];
        
        __autoreleasing NSError *jsonParseErr = nil;
        
        NSData *dataJsonStr = [[dict objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataParseDict = [NSJSONSerialization JSONObjectWithData:dataJsonStr options:NSJSONReadingAllowFragments error:&jsonParseErr];
        if (jsonParseErr) {
            DLog(@"解析失败");
            return;
        }
        
        NSMutableDictionary *mutableJson = [dict mutableCopy];
        [mutableJson setObject:dataParseDict forKey:@"data"];
        
        NSDictionary *transformedJson = [NSDictionary dictionaryWithDictionary:mutableJson];
        
        NSNumber *errCode = [json objectForKey:@"code"];
        DLog(@"jsonData:%@,解密后的：%@,解析后的：%@", json, dict, transformedJson);
        

        // !!!:不管服务器返回的 data 字段是否为空，都交给每个接口去处理
        [self handleData:transformedJson errCode:[errCode stringValue]];
    }
    
    if (_showHUD) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
        _showHUD = NO;
    }

    dispatch_async(dispatch_get_main_queue(), ^{
        [self clearCompletionBlock];
    });
}

- (NSDictionary *)decryptJSONObject:(NSDictionary *)json usingAlgorithm:(EncryptAlgorithm)algorithm {
    if (algorithm == EncryptAlgorithmNone) {
        return json;
    }
    else {
        if ([json.allKeys containsObject:@"data"]) {
            NSData *decryptData;
            id obj = [json objectForKey:@"data"];
            if ([obj isKindOfClass:[NSDictionary class]]) {
                __autoreleasing NSError *jsonErr = nil;
                decryptData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&jsonErr];
                if (jsonErr) {
                    DLog(@"jsonErr: %@", jsonErr);
                    return json;
                }
            }
            else if ([obj isKindOfClass:[NSString class]]) {
                NSString *stringObj = (NSString *)obj;
                decryptData = [stringObj dataUsingEncoding:NSUTF8StringEncoding];
            }
            else if ([obj isKindOfClass:[NSNumber class]]) {
                NSNumber *numberObj = (NSNumber *)obj;
                NSString *numberObjStr = [numberObj stringValue];
                decryptData = [numberObjStr dataUsingEncoding:NSUTF8StringEncoding];
            }
            
            /* Decrypt NSData */
            switch (algorithm) {
                case EncryptAlgorithmNone: {
                    
                } break;
                case EncryptAlgorithmRSA: {
                    
                } break;
                case EncryptAlgorithmAES: {
                    
                } break;
                case EncryptAlgorithmBase64: {
                    decryptData = [[NSData alloc] initWithBase64EncodedData:decryptData options:NSDataBase64DecodingIgnoreUnknownCharacters];
                } break;
            }
            
            /* Decrypt Fail */
            if (decryptData == nil) return nil;
            
            //替换字段对应的内容
            NSString *decryptedStr = [[NSString alloc] initWithData:decryptData
                                                           encoding:NSUTF8StringEncoding];
            /* Crash保护 */
            if (decryptedStr == nil) return nil;
            
            NSMutableDictionary *mutableDict = [json mutableCopy];
            [mutableDict setObject:decryptedStr
                            forKey:@"data"];
            return [NSDictionary dictionaryWithDictionary:mutableDict];
        }
        
        return json;
    }
}

///< 可以修改，根据自己服务端返回的 json 数据格式修改
- (id)preHandleData:(id)data error:(NSError *)error {
    if (error) {
        return error.localizedFailureReason;
    }
    
    NSDictionary *jsonDict = (NSDictionary *)data;
    NSString *errCode = [jsonDict objectForKey:@"code"];
    if ([errCode isEqualToString:kSuccessErrCode]) {
        NSDictionary *resultData = nil;
        if ([jsonDict.allKeys containsObject:@"data"]) {
            resultData = [jsonDict objectForKey:@"data"];
        }
        
        return jsonDict;
    }
    else if ([errCode isEqualToString:@"0002"]) {//参数不完整
        return jsonDict;
    }
    else if ([errCode isEqualToString:@"0011"]) {//会话失效，重新登录
//        ///<1秒之后，自动跳转到登录页面
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [UIViewController showLoginControllerAnimated:YES];
//        });
        
        return jsonDict;
    }
    else {
        //NSString *message = NSLocalizedString(@"网络错误", nil);
        return jsonDict;
    }
}

///< nil out to break the retain cycle.
- (void)clearCompletionBlock {
    self.successBlock = nil;
    self.failureBlock = nil;
}

- (NSTimeInterval)requestTimeoutInterval {
    return _timeoutInterval;
}

///< 允许使用蜂窝移动网
- (BOOL)allowsCellularAccess {
    return YES;
}

- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    return nil;
}

- (RequestMethod)requestMethod {
    return RequestMethodGET;
}

- (RequestSerializerType)requestSerializerType {
    return RequestSerializerTypeHTTP;
}

- (ResponseSerializerType)responseSerializerType {
    return ResponseSerializerTypeJSON;
}

- (NSDictionary *)requestArguments {
    NSAssert([self isMemberOfClass:[BaseRequest class]], @"子类必须实现requestArguments");
    return nil;
}

- (NSString *)requestURLPath {
    NSAssert([self isMemberOfClass:[BaseRequest class]], @"子类必须实现requestURLPath");
    return nil;
}

- (AFConstructingBodyBlock)constructingBodyBlock {
    return nil;
}

- (void)handleData:(id)data errCode:(NSString *)errCode {
    NSAssert([self isMemberOfClass:[BaseRequest class]], @"子类必须实现handleData:data errCode:errCode");
}

/**
 *  新增的方法，用来验证https证书，这个方法其实是自己实现了afn自带方法
 *
 *  @return 证书模式的SecurityPolicy，AFSecurityPolicy有3种安全验证方式
 *          具体看头文件的枚举
 *  此方法直接使用：afn自带的就可以
 *  NSSet *cert = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
 *  AFSecurityPolicy * securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate
 *  withPinnedCertificates:cert];
 *  securityPolicy.allowInvalidCertificates = YES;
 *  securityPolicy.validatesDomainName = YES;
 */
- (AFSecurityPolicy *)customSecurityPolicy {
    //先导入证书到项目
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:kCertificateName ofType:@"cer" inDirectory:@"HttpsServerAuth.bundle"];//证书的路径
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
 
    DLog(@"%@--%@", cerPath, cerData);

    //AFSSLPinningModeCertificate使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];

    //allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    //如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;

    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;

    //validatesCertificateChain 是否验证整个证书链，默认为YES
    //设置为YES，会将服务器返回的Trust Object上的证书链与本地导入的证书进行对比，这就意味着，假如你的证书链是这样的：
    //GeoTrust Global CA
    //    Google Internet Authority G2
    //        *.google.com
    //那么，除了导入*.google.com之外，还需要导入证书链上所有的CA证书（GeoTrust Global CA, Google Internet Authority G2）；
    //如是自建证书的时候，可以设置为YES，增强安全性；假如是信任的CA所签发的证书，则建议关闭该验证，因为整个证书链一一比对是完全没有必要（请查看源代码）；
//    securityPolicy.validatesCertificateChain = NO;

    NSSet *cerDataSet = [NSSet setWithArray:@[cerData]];
    securityPolicy.pinnedCertificates = cerDataSet;

    return securityPolicy;
}

@end
