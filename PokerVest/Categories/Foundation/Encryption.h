//
//  Encryption.h
//  XiaobanParent
//
//  Created by keymon on 2018/6/1.
//  Copyright © 2018年 xiaoban. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Encrypt)

/**
 * RSA 加密
 */
- (NSString *)RSAEncryptWithPublicKey:(NSString *)pubKey;

/**
 * MD5 加密
 */
- (NSString *)md5Encrypt;

/**
 * sha1 加密
 */
- (NSString *)sha1Encrypt;

/**
 * sha256 加密
 */
- (NSString *)sha256Encrypt;

/**
 * sha512 加密
 */
- (NSString *)sha512Encrypt;

- (NSString *)hmacMD5StringWithKey:(NSString *)key;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

/**
 * AES 加密
 */
- (NSString*)encryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv;
/**
 * AES 解密
 */
- (NSString*)decryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv;

/**
 * AES256 加密,AES_256_CBC_PKCS7Padding+HMAC, 加密后输出的格式为IV+AES密文+SHA256+Salt
 */
- (NSString *)AES256EncryptWithKey:(NSString *)key;
/**
 * AES256 解密
 */
- (NSString *)AES256DecryptWithKey:(NSString *)key;

/**
 * 3DES 加密
 */
- (NSString*)encryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;
/**
 * 3DES 解密
 */
- (NSString*)decryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;

/**
 * Base64 编码
 */
+ (NSString *)stringWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;


@end


@interface NSData (Encrypt)

/**
 * RSA 加密 Data
 */
- (NSData *)RSAEncryptWithPublicKey:(NSString *)pubKey;

/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *md5Data;

/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *sha1Data;

/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *sha256Data;

/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *sha512Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacMD5DataWithKey:(NSData *)key;

/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA1DataWithKey:(NSData *)key;

/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA256DataWithKey:(NSData *)key;

/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)hmacSHA512DataWithKey:(NSData *)key;

/**
 *  @brief  字符串base64后转data
 *
 *  @param string 传入字符串
 *
 *  @return 传入字符串 base64后的data
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

/**
 *  @brief  NSData转string
 *
 *  @param wrapWidth 换行长度  76  64
 *
 *  @return base64后的字符串
 */
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

/**
 *  @brief  NSData转string 换行长度默认64
 *
 *  @return base64后的字符串
 */
- (NSString *)base64EncodedString;

/**
 *  利用AES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief  利用AES解密据
 *
 *  @param key key
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;

/**
 *  利用3DES加密数据
 *
 *  @param key key
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
- (NSString *)UTF8String;

@end
