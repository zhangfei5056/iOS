//
//  FuckHttp.h
//  testPOSTJSONinOC
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuckHttp : NSObject
+(NSMutableDictionary*)post:(NSString*)url postDic:(NSMutableDictionary*)postData;
+(NSMutableDictionary*)get:(NSString*)url;
@end
