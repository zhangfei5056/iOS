//
//  FuckJSON.h
//  testPOSTJSONinOC
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FuckJSON : NSObject
+(NSData *)dicToJSON:(NSMutableDictionary*)dic;
+(NSData *)aryToJSON:(NSMutableArray*)mutableAry;
+(NSMutableDictionary*)JSONtoDic:(NSData*)json;
+(NSString*)JSONtoString:(NSData*)json;
+(NSMutableArray*)JSONtoArray:(NSData*)json;
@end
