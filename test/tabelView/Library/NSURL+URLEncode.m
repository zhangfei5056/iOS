//
//  NSURL+URLEncode.m
//  AddressList
//
//  Created by mini on 13-3-16.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "NSURL+URLEncode.h"

@implementation NSURL (URLEncode)

+ (id)URLWithString_EncodingUTF8:(NSString *)URLString
{
    NSString* URLString_UTF8 = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:URLString_UTF8];
}

@end
