//
//  NSDictionary+URLParam.m
//  AddressList
//
//  Created by mini on 13-3-16.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "NSDictionary+URLParam.h"

@implementation NSDictionary (URLParam)

- (NSString *)urlStringFromDictionary
{
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:0];
    
    NSArray *allKeys = [self allKeys];
    for (NSString *key in allKeys) {
        NSString *value = [self valueForKey:key];
        if (value) {
            if ([allKeys indexOfObject:key] > 1) {
                [string appendString:@"&"];
            }
            [string appendFormat:@"%@=%@",key,value];
        }
    }
    
    return [string autorelease];
}

@end
