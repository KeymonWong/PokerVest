//
//  NSString+Encrypt.h
//  BaiduPlace
//
//  Created by Neusoft on 11-12-5.
//  Copyright (c) 2011 Neusoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

/** MD5加密 */
- (NSString *)md5Encrypt;

/** sha1加密 */
- (NSString *)sha1Encrypt;

/** sha256加密 */
- (NSString *)sha256Encrypt;

/** sha512加密 */
- (NSString *)sha512Encrypt;

- (NSString *)hmacMD5StringWithKey:(NSString *)key;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;


- (NSString*)encryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv;
- (NSString*)decryptedWithAESUsingKey:(NSString *)key andIV:(NSData *)iv;

- (NSString*)encryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;
- (NSString*)decryptedWith3DESUsingKey:(NSString *)key andIV:(NSData *)iv;

@end
