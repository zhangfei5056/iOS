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
    //notifcation key
    UILocalNotification *notifcation = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];


    if (notifcation) {
        NSLog(@"working");
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    [self backGround:10];

}


-(void)private{
    NSNotification *msg = [NSNotification notificationWithName:@"addNevItem" object:[NSString stringWithFormat:@"%i",1]];
    [[NSNotificationCenter defaultCenter] postNotification:msg];

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
        UILocalNotification *notification=[[UILocalNotification alloc] init];

        if (notification!=nil) {


            notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次


            notification.applicationIconBadgeNumber=1; //应用的红色数字


            //去掉下面2行就不会弹出提示框

            notification.alertBody=@"通知内容";//提示信息 弹出提示框

            notification.alertAction = @"打开";  //提示框按钮


            
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];      
            
        }
        // End the task

    });

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
