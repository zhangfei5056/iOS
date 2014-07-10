//
//  NSURL+URLEncode.h
//  AddressList
//
//  Created by mini on 13-3-16.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (URLEncode)

+ (id)URLWithString_EncodingUTF8:(NSString *)URLString;

@end
