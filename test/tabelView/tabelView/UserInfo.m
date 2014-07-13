//
//  UserInfo.m
//  AddressList
//
//  Created by mini on 13-3-18.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo (){
    NSString *_administration;
    NSString *_brithday;
    NSString *_department;
    NSString *_email;
    NSString *_exttex;
    NSString *_name;
    NSString *_oldUnit;
    NSString *_phone;
    NSString *_sex;
    NSString *_tel;
    NSString *_userId;
    NSString *_user_photo;
}

@end

@implementation UserInfo

@synthesize administration = _administration;
@synthesize brithday = _brithday;
@synthesize department = _department;
@synthesize email = _email;
@synthesize exttex = _exttex;
@synthesize name = _name;
@synthesize oldUnit = _oldUnit;
@synthesize phone = _phone;
@synthesize sex = _sex;
@synthesize tel = _tel;
@synthesize userId = _userId;
@synthesize user_photo = _user_photo;

-(void)dealloc
{
    [_administration release];
    [_brithday release];
    [_department release];
    [_email release];
    [_exttex release];
    [_name release];
    [_oldUnit release];
    [_phone release];
    [_sex release];
    [_tel release];
    [_userId release];
    [_user_photo release];
    
    [super dealloc];
}

+(UserInfo *)parserUserInfo:(NSDictionary *)infoDic
{
    UserInfo *info = [[UserInfo alloc] init];
    info.administration = [infoDic objectForKey:@"administration"];
    info.brithday = [infoDic objectForKey:@"brithday"];
    info.department = [infoDic objectForKey:@"department"];
    info.email = [infoDic objectForKey:@"email"];
    info.exttex = [infoDic objectForKey:@"exttex"];
    info.fex = [infoDic objectForKey:@"fex"];
    info.name = [infoDic objectForKey:@"name"];
    info.oldUnit = [infoDic objectForKey:@"oldUnit"];
    info.phone = [infoDic objectForKey:@"phone"];
    info.sex = [infoDic objectForKey:@"sex"];
    info.tel = [infoDic objectForKey:@"tel"];
    info.userId = [infoDic objectForKey:@"userId"];
    info.user_photo = [infoDic objectForKey:@"user_photo"];
    
    return [info autorelease];
}

+(UserInfo *)parserUserInfoFromContactBean:(ContactBean*)contactBean
{
    UserInfo *info = [[UserInfo alloc] init];
    info.administration = contactBean.administration;
    info.brithday = contactBean.birthday;
    info.department = contactBean.department;
    info.email = contactBean.email;
    info.exttex = contactBean.exttex;
    info.fex = contactBean.fex;
    info.name = contactBean.name;
    info.oldUnit = contactBean.oldUnit;
    info.phone = contactBean.phone;
    info.sex = contactBean.sex;
    info.tel = contactBean.tel;
    info.userId = contactBean.userId;
    info.user_photo = contactBean.user_photo;

    return [info autorelease];
    
}

@end
