//
//  AppDelegate.m
//  backgroundNotification
//
//  Created by caoyuan on 7/13/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    int _timeCount;
}

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    [self backGround:30];
    [self detectCopyInBackgroundWithLooptimesMintuesAndSendNotificationWithMessage:30 NotifciatonMsg:[UIPasteboard generalPasteboard].string];


}

-(void)backGround:(int)looptimesMintues{
    int time = looptimesMintues*60;
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

        NSString *pastboardContents = @"1";

        for (int i = 0; i < time; i++)
        {
            if (![pastboardContents isEqualToString:[UIPasteboard generalPasteboard].string] )
            {
                pastboardContents = [UIPasteboard generalPasteboard].string;
                if (![pastboardContents isEqualToString:@"1"]) {

                    NSLog(@"Pasteboard Contents: %@", pastboardContents);
                }
            }
            [UIPasteboard generalPasteboard].string = @"1";

            // Wait some time before going to the beginning of the loop
            [NSThread sleepForTimeInterval:1];
        }

        // End the task
        [application endBackgroundTask:task];
    });
    
}

-(void)detectCopyInBackgroundWithLooptimesMintuesAndSendNotificationWithMessage:(int)looptimesMintues NotifciatonMsg:(NSString*)msg{


    int time = looptimesMintues*60;
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

        NSString *pastboardContents = @"1";

        for (int i = 0; i < time; i++)
        {
            if (![pastboardContents isEqualToString:[UIPasteboard generalPasteboard].string] )
            {
                pastboardContents = [UIPasteboard generalPasteboard].string;
                if (![pastboardContents isEqualToString:@"1"]) {

//                    NSLog(@"Pasteboard Contents: %@", pastboardContents);
                    [self  sendNotification:pastboardContents];
                }
            }
            [UIPasteboard generalPasteboard].string = @"1";

            // Wait some time before going to the beginning of the loop
            [NSThread sleepForTimeInterval:1];
        }

        // End the task
        [application endBackgroundTask:task];
    });
    
}




-(void)sendNotification:(NSString*)msg{
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        NSDate *now=[NSDate new];
        notification.fireDate=[now dateByAddingTimeInterval:0.3];//10秒后通知
        notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.applicationIconBadgeNumber = 0; //应用的红色数字
//        notification.soundName= UILocalNotificationDefaultSoundName;//声音，可以换成alarm.soundName = @"myMusic.caf"
        //去掉下面2行就不会弹出提示框
        notification.alertBody = msg;//提示信息 弹出提示框
        notification.alertAction = @"打开";  //提示框按钮
        //notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
        // NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
        //notification.userInfo = infoDict; //添加额外的信息
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

-(void)cancelAllNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}



- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
