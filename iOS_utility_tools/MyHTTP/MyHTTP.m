//
//  MyHTTP.m
//  PicToLink
//
//  Created by caoyuan on 12/1/14.
//  Copyright (c) 2014 Baidu. All rights reserved.
//

#import "MyHTTP.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@implementation MyHTTP

- (void)testAll {
    [self testGet];
    [self testPost];

}
-(void)testGet {
    NSDictionary * resdic =  [self getRequest:@"http://172.22.149.160:8089/"];
    NSLog(@"%@",resdic);
}

-(void)testPost{
    NSString *url = @"http://172.22.149.160:8089/";
    NSMutableDictionary *postDic = [@{@"cmd":@"login",
                                      @"params":@{@"userName":@"admin",
                                                  @"password":@"111111",
                                                  },
                                      } mutableCopy];
    NSDictionary *resDic = [self postRequestWithDictionary:url Dictionary:postDic];
    NSLog(@"%@",resDic);
}

//ASI get请求
-(NSDictionary*)getRequest:(NSString*)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (error) {
        NSLog(@"%@",error);
        NSLog(@"------Request failed------");
        NSDictionary *resDic = @{@"result":@"----Reuqest failed----"};
        return resDic;
    }else {
        NSString *responseString = [request responseString];
        //        NSLog(@"%@",responseString);
        //        NSLog(@"-----------Request success--------------");
        NSDictionary *resDic = [responseString objectFromJSONString];
        return resDic;
    }
}
// ASI POST Dic
-(NSDictionary*)postRequestWithDictionary:(NSString*)urlString Dictionary:(NSMutableDictionary*)postDic {

    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    // ----------JSONKit , transfor Dic to NSData-----------
    NSMutableData* postData = (NSMutableData*)[postDic JSONData];
    // ----------JSONKit , transfor Dic to NSData-----------
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    [request setTimeOutSeconds:30];
    [request setPostBody:postData];
    [request startSynchronous];
    NSError *error = [request error];
    if (error) {
        NSLog(@"%@",error);
        NSDictionary *resDic = @{@"status":@"------Request Failed-----"};
        return resDic;
    } else {
        NSString *resDicString = [request responseString];
        NSLog(@"%@",resDicString);
        NSDictionary *resDic = [resDicString objectFromJSONString];
        return resDic;
    }
}

@end
