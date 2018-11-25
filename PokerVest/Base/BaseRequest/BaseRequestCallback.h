//
//  RequestCallback.h
//  Networking
//
//  Created by 小伴 on 2017/1/6.
//  Copyright © 2017年 huangqimeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseRequest;

@protocol AFMultipartFormData;

///<通常会上传图片或者文件需要用到multipart/form-data
typedef void(^AFConstructingBodyBlock)(id<AFMultipartFormData> data);
typedef void(^AFURLSessionTaskProgressBlock)(NSProgress *progress);


/*!
 *   AFN 请求封装的Block回调
 */
typedef void(^RequestSuccessBlock)(NSString *errCode, NSDictionary *responseDict, id model);
typedef void(^RequestFailureBlock)(NSError *error);


/*!
 *   AFN 请求封装的代理回调
 */
@protocol BaseRequestDelegate <NSObject>

@optional
/**
 *   请求结束
 *   @param returnData 返回的数据
 */
- (void)requestDidFinishedWithData:(id)returnData errCode:(NSString *)errCode;

/**
 *   请求失败
 *   @param error 失败的 error
 */
- (void)requestDidFailWithError:(NSError *)error;

/**
 *   网络请求项即将被移除掉
 *   @param item 网络请求项
 */
- (void)requestWillDealloc:(BaseRequest *)item;
@end
