//
//  FuckHttp.h
//  testPOSTJSONinOC
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuckHttp : NSObject
+(NSMutableDictionary*)postStringReturnDic:(NSString*)url postString:(NSString*)postDataString;
+(NSMutableDictionary*)postReturnDic:(NSString*)url postDic:(NSMutableDictionary*)postData;
+(NSString*)postReturnString:(NSString*)url postDic:(NSMutableDictionary*)postData;
+(NSMutableDictionary*)getReturnDic:(NSString*)url;
+(NSString*)getReturnString:(NSString*)url;

@end
