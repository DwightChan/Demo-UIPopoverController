//
//  UIImage+GetColor.h
//  xxx
//
//  Created by chendehao on 16/4/13.
//  Copyright © 2016年 CDHao. All rights reserved.
//  用于取摸个像素的颜色的分类

#import <UIKit/UIKit.h>

@interface UIImage (GetColor)

/**
 *  获得某个像素的颜色
 *
 *  @param point 像素点的位置
 */
- (UIColor *)pixelColorAtLocation:(CGPoint)point;


@end
