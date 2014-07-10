//
//  GroupBean.h
//  testTableViewForAddressList
//
//  Created by caoyuan on 7/10/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBean : NSObject
@property (strong, nonatomic) NSString* deptName;
@property (strong, nonatomic) NSString* deptId;
@property (strong, nonatomic) NSString* deptListTotal;
@property (strong, nonatomic) NSArray* deptDetail;
@property (strong, nonatomic) NSArray* child;

@end
