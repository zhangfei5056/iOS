//
//  testOATests.m
//  testOATests
//
//  Created by caoyuan on 8/17/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "JSON.h"
#import "FuckHttp.h"
@interface testOATests : XCTestCase

@end

@implementation testOATests

-(void)testFun{
    NSString* name = @"gaolin";
    NSLog(@"=========\nthe number length is :%d\n==========",[name length]);
//    NSDictionary *selectDiaryDic = @{@"cmd":@"selectAttenDuty", @"name":name,@"number":@3};
    NSDictionary *selectDiaryDic = @{@"cmd":@"selectDiary", @"name":name,@"number":@3};

    NSDictionary *resDic = [self postDicReturnDic:selectDiaryDic];
//    NSLog(@"%@",resDic);
    NSString* items = [[resDic objectForKey:@"cmd"] objectAtIndex:0];
    NSLog(@"========\n%@\n============",items);

//    NSString* substr = [items substringWithRange:NSMakeRange(5+1+[name length]+3, 19)];
    NSString* substr = [items substringWithRange:NSMakeRange(5+1+[name length]+1+19+2, 19)];

    NSLog(@"====\n%@\n====",substr);


}


-(NSDictionary*)postDicReturnDic:(NSDictionary*)postDic
{
    NSString *muteDicStr = [postDic JSONRepresentation];
    NSDictionary *dic = [FuckHttp postStringReturnDic:@"http://192.168.254.68:12343" postString:muteDicStr];
    return dic;
}

@end
