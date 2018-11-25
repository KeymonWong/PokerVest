//
//  UIImage+UIImageScale.m
//  BaiduPlace
//
//  Created by Neusoft on 12-6-8.
//  Copyright (c) 2012年 Neusoft. All rights reserved.
//

#import "UIImage+UIImageScale.h"

@implementation UIImage(UIImageScale)

//截取部分图像 
-(UIImage*)getSubImage:(CGRect)rect
{ 
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect); 
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef)); 
    
    UIGraphicsBeginImageContext(smallBounds.size); 
    CGContextRef context = UIGraphicsGetCurrentContext(); 
    CGContextDrawImage(context, smallBounds, subImageRef); 
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef]; 
    UIGraphicsEndImageContext(); 
    
    CGImageRelease(subImageRef);
    
    return smallImage; 
}

//截取部分图像
-(UIImage*)getMiddleImage:(CGRect)rect
{
    float scale = [[ UIScreen mainScreen ] scale];
    rect.size.width *= scale;
    rect.size.height *= scale;
    float width = CGImageGetWidth(self.CGImage) ;
    float height = CGImageGetHeight(self.CGImage) ;
    
    CGRect frame = CGRectMake((width - rect.size.width)/2., (height - rect.size.height)/2. , rect.size.width , rect.size.height );
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, frame);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    CGImageRelease(subImageRef);
    
    return smallImage;
}

//等比例缩放 
-(UIImage*)scaleToSize:(CGSize)size withWidth:(BOOL)widthOrHeight
{ 
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    if ( widthOrHeight == YES )
    {
        width = size.width;
        height = height * horizontalRadio;
    }
    else
    {
        width = width * verticalRadio;
        height = size.height;
    }
    
/*    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1) 
    { 
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    } 
    else 
    { 
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    } 
    
    width = width*radio;
    height = height*radio;
*/    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context   
    // 并把它设置成为当前正在使用的context   
    UIGraphicsBeginImageContext(size);   
    
    // 绘制改变大小的图片   
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];   
    
    // 从当前context中创建一个改变大小后的图片   
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();   
    
    // 使当前的context出堆栈   
    UIGraphicsEndImageContext();   
    
    // 返回新的改变大小后的图片   
    return scaledImage; 
}

@end  
