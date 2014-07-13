//
//  UserInfo.h
//  AddressList
//
//  Created by mini on 13-3-18.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactBean.h"
@interface UserInfo : NSObject

@property(nonatomic, retain)NSString *administration;
@property(nonatomic, retain)NSString *brithday;
@property(nonatomic, retain)NSString *department;
@property(nonatomic, retain)NSString *email;
@property(nonatomic, retain)NSString *exttex;
@property(nonatomic, retain)NSString *fex;
@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *oldUnit;
@property(nonatomic, retain)NSString *phone;
@property(nonatomic, retain)NSString *sex;
@property(nonatomic, retain)NSString *tel;
@property(nonatomic, retain)NSString *userId;
@property(nonatomic, retain)NSString *user_photo;

//解析用户信息
+(UserInfo *)parserUserInfo:(NSDictionary *)infoDic;
+(UserInfo *)parserUserInfoFromContactBean:(ContactBean*)contactBean;
@end
