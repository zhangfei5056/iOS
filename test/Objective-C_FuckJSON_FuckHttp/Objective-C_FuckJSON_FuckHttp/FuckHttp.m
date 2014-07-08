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

+(NSMutableArray*)post:(NSString*)url postDic:(NSMutableDictionary*)postData;
{
    NSURL* URL = [NSURL URLWithString:url];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    NSData * jsonDataFromDic = [FuckJSON dicToJSON:postData];
    [request  setHTTPBody:jsonDataFromDic];
    NSData *receiveNSData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSMutableDictionary *dic = [FuckJSON JSONtoDic:receiveNSData];
    return dic[@"detail"][@"dataList"];

}

@end