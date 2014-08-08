//
//  BlockMethod.m
//  testASIHttp
//
//  Created by caoyuan on 8/7/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BlockMethod.h"
#import "ASIHTTPRequest.h"
@implementation BlockMethod



-(void)test{
__block NSString *tempString;
[BlockMethod dispatchBlockFromBackgroundMethodToFrontMethod:^(void){
//    tempString = [self getRequest:self.urlString];
} doSomethingInFront:^(void){
//    self.label.text = tempString;
}];
}

+(void)dispatchBlockFromBackgroundMethodToFrontMethod:(void(^)(void))backgroundBlock doSomethingInFront:(void (^)(void))frontBlock {
    // GCD start ----
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing start--------
        backgroundBlock();
        //     background doing over--------
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing start-----
            frontBlock();
            //     main thread doing over-----
        });
    });
    // GCD over ----
}

-(NSString*)getRequest:(NSString*)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (error) {
        NSLog(@"%@",error);
        return @"------Request failed------";
    }else {
        NSString *responseString = [request responseString];
        NSLog(@"%@",responseString);
        NSLog(@"-----------Request success--------------");
        return responseString;
    }
}



@end
