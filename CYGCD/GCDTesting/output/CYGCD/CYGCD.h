//
//  CYGCD.h
//
//
//  Created by caoyuan on 8/16/15.
//
//

/*    Usage
 
 [[CYGCD getCYQueue] doInCYQueue:^{
 
 // do your code;
 
 [[CYGCD getCYQueue] doInMainQueue:^{
 // do your code;
 }];
 }];
 
 [[CYGCD getCYQueue] doInCYQueue:^{
 
 // do your code;
 }];
 
 [[CYGCD getCYQueue] doInGlobalQueue:^{
 // do your code;
 }];
 
 */
#import <Foundation/Foundation.h>
typedef void (^Block)(void);
@interface CYGCD : NSObject

+ (CYGCD*)getCYQueue;

/**
 *  在CY的Queue中运行，一个个顺序运行，只管朝里丢
 *
 *  @param block 你要执行的任务
 */
- (void)doInCYQueue:(Block)block;

/**
 *  在Main Queue中运行（UI queue），
 *
 *  @param block 你要执行的任务
 */
- (void)doInMainQueue:(Block)block;

/**
 *  在Global Queue中运行, 丢进去立即并行运行，
 *
 *  @param block 你要执行的任务
 */
- (void)doInGlobalQueue:(Block)block;
@end
