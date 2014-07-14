//
//  CopyMsgNotificationBackground.m
//  FinalShanBay
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CopyMsgNotificationBackground.h"
@implementation CopyMsgNotificationBackground


//[self detectCopyInBackgroundWithLooptimesMintuesAndSendNotificationWithMessage:30 NotifciatonMsg:[UIPasteboard generalPasteboard].string];



+(void)detectCopyInBackgroundWithLooptimesMintuesAndSendNotificationWithMessage:(int)looptimesMintues NotifciatonMsg:(NSString*)msg{
    int time = looptimesMintues*60*2;
    // Create a background task identifier
    UIApplication *application = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier task;
    task = [application beginBackgroundTaskWithExpirationHandler:^{
        NSLog(@"System terminated background task early");
        [application endBackgroundTask:task];
    }];

    // If the system refuses to allow the task return
    if (task == UIBackgroundTaskInvalid)
    {
        NSLog(@"System refuses to allow background task");
        return;
    }

    // Do the task
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        NSString *pastboardContents = @"1784588";

        for (int i = 0; i < time; i++)
        {   // if pasetboard content is not as the same , then run barcket inside
            if (![pastboardContents isEqualToString:[UIPasteboard generalPasteboard].string] )
            {
                pastboardContents = [UIPasteboard generalPasteboard].string;
                //if pastebaord contents is not "1",then run in side, because I make the pastboard to "1784588" while  every loop end
                // that make if you keep copy the same words, this works! just not "1784588"
                if (![pastboardContents isEqualToString:@"1784588"]) {
                    //whatever you want runing in backround ,just coding here...
                    // NSLog(@"Pasteboard Contents: %@", pastboardContents);
                    [self sendNotification:pastboardContents];
                }
            }
            [UIPasteboard generalPasteboard].string = @"1784588";

            // Wait some time before going to the beginning of the loop
            [NSThread sleepForTimeInterval:0.5];
            //            [self cancelAllNotification];
        }

        // End the task
        [application endBackgroundTask:task];
    });

}




+(void)sendNotification:(NSString*)msgShowUp{
    //发送通知
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        NSDate *now=[NSDate new];
        notification.fireDate=[now dateByAddingTimeInterval:0.2];//10秒后通知
        notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.applicationIconBadgeNumber=0; //应用的红色数字
        notification.soundName= UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
        //去掉下面2行就不会弹出提示框

        notification.alertBody = msgShowUp;//提示信息 弹出提示框
        notification.alertAction = @"打开";  //提示框按钮
        //        notification.hasAction = YES; //是否显示额外的按钮，为no时alertAction消失
        // NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
        //notification.userInfo = infoDict; //添加额外的信息
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

+(void)cancelAllNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


@end
