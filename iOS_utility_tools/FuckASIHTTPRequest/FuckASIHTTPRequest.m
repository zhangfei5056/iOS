//
//  FuckASIHTTPRequest.m
//  testASIHttp
//
//  Created by caoyuan on 8/7/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "FuckASIHTTPRequest.h"
#import "ASIHTTPRequest.h"
@implementation FuckASIHTTPRequest
//-(void)Demo{
//    __block NSString *tempString;
//    [BlockMethod dispatchBlockFromBackgroundMethodToFrontMethod:^(void){
//        //    tempString = [self getRequest:self.urlString];
//    } doSomethingInFront:^(void){
//        //    self.label.text = tempString;
//    }];
//}



+(void)getASIRequest:(void(^)(void))backgroundBlock doSomethingInFront:(void (^)(void))frontBlock {
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

@end
