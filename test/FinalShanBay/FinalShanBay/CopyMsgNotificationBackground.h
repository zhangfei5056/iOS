//
//  CopyMsgNotificationBackground.h
//  FinalShanBay
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CopyMsgNotificationBackground : NSObject
+(void)detectCopyInBackgroundWithLooptimesMintuesAndSendNotificationWithMessage:(int)looptimesMintues NotifciatonMsg:(NSString*)msg;
+(void)sendNotification:(NSString*)msgShowUp;
+(void)cancelAllNotification;
@end
