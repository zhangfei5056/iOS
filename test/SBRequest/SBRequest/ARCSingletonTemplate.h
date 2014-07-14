//
//  ARCSingletonTemplate.h
//  testSingletonForDefine
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
/*
 this is is a Maroc define for singleton,
 for example a class called Appconfig,
 you just need import this ARCSingletonTemplate.h 
 in front your AppConfig.h 
 and then 
 in the interface part you declare with :
    #define SYNTHESIZE_SINGLETON_FRO_HEADER(AppConfig)
 and in the implentation declare with:
    #define SYNTHESIZE_SINGLETON_FOR_CLASS(AppConfig)
 then your AppConfig class will turn to a singleton class

*/
#ifndef testSingletonForDefine_ARCSingletonTemplate_h
#define testSingletonForDefine_ARCSingletonTemplate_h


#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SYNTHESIZE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


#endif
