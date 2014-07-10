//
//  ContactBean.m
//  testTableViewForAddressList
//
//  Created by caoyuan on 7/10/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "ContactBean.h"
//#import "GroupBean.h"

@implementation ContactBean
{
    NSMutableArray *contacts;
}
- (id)init
{
    self = [super init];
    if (self) {
//        contacts = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}



//-(NSMutableArray*)parseJSONArray:(NSMutableArray*)agencyGroupList{
//    NSMutableArray *groups = [[NSMutableArray alloc]initWithCapacity:1];
//    for (NSDictionary* jsonObject in agencyGroupList) {
//        GroupBean *groupBean = [[GroupBean alloc] init];
//        groupBean.deptName = [jsonObject objectForKey:@"deptName"];
//        groupBean.deptId = [jsonObject objectForKey:@"deptId"];
//        groupBean.deptListTotal = [jsonObject objectForKey:@"deptListTotal"];
//        NSArray *contactArray = nil;
//        contactArray = [jsonObject objectForKey:@"deptDetail"];
//        if (contactArray != nil && [contactArray count] > 0) {
//            for (NSDictionary *contactJsonObject in contactArray) {
//                ContactBean *contactBean = [[ContactBean alloc] init];
//                contactBean.userId = [contactJsonObject objectForKey:@"userId"];
//                contactBean.name = [contactJsonObject objectForKey:@"name"];
//                contactBean.sex = [contactJsonObject objectForKey:@"sex"];
//                contactBean.phone = [contactJsonObject objectForKey:@"phone"];
//                contactBean.tel = [contactJsonObject objectForKey:@"tel"];
//                contactBean.fex = [contactJsonObject objectForKey:@"fex"];
//                contactBean.exttex = [contactJsonObject objectForKey:@"exttex"];
//                contactBean.email = [contactJsonObject objectForKey:@"email"];
//                contactBean.birthday = [contactJsonObject objectForKey:@"brithday"];
//                contactBean.administration = [contactJsonObject objectForKey:@"administration"];
//                contactBean.department = [contactJsonObject objectForKey:@"department"];
//                contactBean.oldUnit = [contactJsonObject objectForKey:@"oldUnit"];
//                contactBean.user_photo = [contactJsonObject objectForKey:@"user_photo"];
//                [contacts addObject:contactBean];
//            }
//            groupBean.deptDetail = contacts;
//        }
//        else {
//            groupBean.deptDetail = nil;
//        }
//
//        @try {
//            NSMutableArray *childArray = [jsonObject objectForKey:@"child"];
//            if (nil != childArray && [childArray count] > 0) {
//                groupBean.child = [self parseJSONArray:childArray];
//            }
//            else {
//                groupBean.child = nil;
//            }
//        }
//        @catch (NSException *exception) {
//            groupBean.child = nil;
//        }
//        [groups addObject:groupBean];
//    }
//    return groups;
//}



@end
