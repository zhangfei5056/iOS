//
//  FuckJSON.m
//  testPOSTJSONinOC
//
//  Created by caoyuan on 7/8/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "FuckJSON.h"

@implementation FuckJSON
+(NSData *)dicToJSON:(NSMutableDictionary*)mutableDic
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutableDic options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

+(NSData *)aryToJSON:(NSMutableArray*)mutableAry
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:mutableAry options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}

+(NSMutableDictionary*)JSONtoDic:(NSData*)json
{
    NSString *responseString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
    NSData *strData = [responseString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSMutableDictionary *mutableDic = (NSMutableDictionary*)[NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableLeaves error:nil];
    return mutableDic;
}

+(NSString*)JSONtoString:(NSData*)json {
    NSString *responseString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
    NSData *strData = [responseString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *str1 = [[NSString alloc]initWithData:strData encoding:NSUTF8StringEncoding];
    return str1;
}




+(NSMutableArray*)JSONtoArray:(NSData*)json
{
    NSString *responseString = [[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding];
    NSData *strData = [responseString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSMutableArray *mutableDic = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableLeaves error:nil];
    return mutableDic;
}

@end
