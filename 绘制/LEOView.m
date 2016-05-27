//
//  LEOView.m
//  绘制
//
//  Created by 李子海LEO on 5/24/16.
//  Copyright © 2016 李子海LEO. All rights reserved.
//

#import "LEOView.h"
//#include <CoreText/CTDefines.h>
//#include <CoreText/CTFrame.h>
//#include <CoreText/CTTypesetter.h>
#include <CoreText/CoreText.h>

//typedef const struct __CTFramesetter *CTFramesetterRef;

@implementation LEOView

-(void)drawRect:(CGRect)rect
{
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 100, 100)];
    
    //创建图片上下文
    UIGraphicsBeginImageContext(imageView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置图片背景色
    [[UIColor whiteColor] setFill];
    CGContextFillRect(context, imageView.bounds);
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"Hello , CoreText\nthis is an image"];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(17, 16)];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, imageView.bounds);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)string);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, string.length), path, NULL);
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, CGRectGetHeight(imageView.bounds));
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFrameDraw(frame, context);
    CFRelease(path);
    CFRelease(framesetter);
    CFRelease(frame);
    
    
    //从图片上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        imageView.image = image;
        
        UIGraphicsEndImageContext();
        
        [self addSubview:imageView];
        
    });
});
    
}

@end
