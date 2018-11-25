//
//  UIImage+UIImageScale.h
//  BaiduPlace
//
//  Created by Neusoft on 12-6-8.
//  Copyright (c) 2012年 Neusoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(UIImageScale)

- (UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)getMiddleImage:(CGRect)rect;
- (UIImage*)scaleToSize:(CGSize)size withWidth:(BOOL)widthOrHeight;

@end
