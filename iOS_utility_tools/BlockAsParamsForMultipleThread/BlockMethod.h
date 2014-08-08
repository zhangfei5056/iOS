//
//  BlockMethod.h
//  testASIHttp
//
//  Created by caoyuan on 8/7/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockMethod : NSObject
+(void)dispatchBlockFromBackgroundMethodToFrontMethod:(void(^)(void))backgroundBlock doSomethingInFront:(void (^)(void))frontBlock;
@end
