//
//  UIColor+Hex.h
//  DealExtreme
//
//  Created by xiongcaixing on 10-8-30.
//  Copyright 2010 epro. All rights reserved.
//

#import <Foundation/Foundation.h>

// 扩展UIColor类
@interface UIColor(Hex)

// 将十六进制的颜色值转为objective-c的颜色
+ (id)getColor:(NSString *) hexColor;

@end