//
//  AppConfig.h
//  testSingletonForDefine
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARCSingletonTemplate.h"    
@interface AppConfig : NSObject
SYNTHESIZE_SINGLETON_FOR_HEADER(AppConfig)

@property (strong, nonatomic) NSString* dataFortest;



@end
