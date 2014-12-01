//
//  MyHTTP.h
//  PicToLink
//
//  Created by caoyuan on 12/1/14.
//  Copyright (c) 2014 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHTTP : NSObject
-(void)testAll;
-(void)testGet;
-(void)testPost;

//ASI get请求
-(NSDictionary*)getRequest:(NSString*)urlString;
// ASI POST Dic
-(NSDictionary*)postRequestWithDictionary:(NSString*)urlString Dictionary:(NSMutableDictionary*)postDic;
@end
