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


+(NSMutableDictionary*)postStringReturnDic:(NSString*)url postString:(NSString*)postDataString
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *postData = [postDataString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [request  setHTTPBody:postData];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableDictionary *dic = [FuckJSON JSONtoDic:receiveNSData];

    return dic;
}

+(NSMutableDictionary*)postReturnDic:(NSString*)url postDic:(NSMutableDictionary*)postData
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

+(NSString*)postReturnString:(NSString*)url postDic:(NSMutableDictionary*)postData
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData * jsonDataFromDic = [FuckJSON dicToJSON:postData];
    [request  setHTTPBody:jsonDataFromDic];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *dic = [FuckJSON JSONtoString:receiveNSData];

    return dic;

}


+(NSMutableDictionary*)getReturnDic:(NSString*)url
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"GET"];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableDictionary *dic = [FuckJSON JSONtoDic:receiveNSData];
    return dic;

}

+(NSString*)getReturnString:(NSString*)url
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"GET"];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
     NSString *dic = [FuckJSON JSONtoString:receiveNSData];
    return dic;

}


@end