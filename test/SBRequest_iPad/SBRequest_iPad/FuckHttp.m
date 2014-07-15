//
//  FuckHttp.m
//  testPOSTJSONinOC
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "FuckHttp.h"
#import "FuckJSON.h"
@implementation FuckHttp

+(NSMutableDictionary*)post:(NSString*)url postDic:(NSMutableDictionary*)postData
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData * jsonDataFromDic = [FuckJSON dicToJSON:postData];
    [request  setHTTPBody:jsonDataFromDic];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableDictionary *dic = [FuckJSON JSONtoDic:receiveNSData];
    return dic;

}

+(NSMutableDictionary*)get:(NSString*)url
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"GET"];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableDictionary *dic = [FuckJSON JSONtoDic:receiveNSData];
    return dic;

}

@end