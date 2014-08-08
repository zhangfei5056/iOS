//
//  AppConfig2.h
//  testSingletonForDefine
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARCSingletonTemplate.h"    
@interface AppConfig2 : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(AppConfig2)

@property (strong, nonatomic) NSString* dataFortest;
@property (strong, nonatomic) NSString* cnWord;
@property (strong, nonatomic) NSString* enWord;


@end
