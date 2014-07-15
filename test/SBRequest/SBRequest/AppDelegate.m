//
//  AppDelegate.m
//  SBRequest
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "AppDelegate.h"
#import "AuthorizationViewController.h"
#import "AppConfig.h"
#import "FuckHttp.h"
#import "CopyMsgNotificationBackground.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[AuthorizationViewController alloc] init];
    [self.window makeKeyAndVisible];
//    [application setMinimumBackgroundFetchInterval:1];
       [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerActionFront:) userInfo:nil repeats:YES];
    return YES;
}

-(void)timerActionFront:(NSTimer*)timer{
    NSLog(@"-----");
    int d = [[[UIApplication sharedApplication] valueForKey:@"backgroundTimeRemaining"] floatValue];


    NSLog(@"%d remaining",d);
}

-(void)timerAction:(NSTimer*)timer{
    _count++;

    if (_count  == 10) {
        UIApplication *application = [UIApplication sharedApplication];
        [application beginBackgroundTaskWithExpirationHandler:^(void){

        }];
        _count = 0;
    }
    NSLog(@"%d",_count);

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //form 'this line' to 'Do the task' line ,new a thread keep call timeAction; to hold application active in background.
    _taskId = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:_taskId];
        _taskId = UIBackgroundTaskInvalid;
    }];
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:self repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }];
    // Do the task
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self searchWordInBackground];
        // End the task
        [application endBackgroundTask:_taskId];
    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - search words method:

-(void)searchWordInBackground{

    NSString *pastboardContents = @"1784588";

    for (int i = 0; i < 7200; i++)
    {   // if pasetboard content is not as the same , then run barcket inside
        if (![pastboardContents isEqualToString:[UIPasteboard generalPasteboard].string] )
        {
            pastboardContents = [UIPasteboard generalPasteboard].string;
            [AppConfig sharedAppConfig].enWord = pastboardContents;
            //if pastebaord contents is not "1",then run in side, because I make the pastboard to "1784588" while  every loop end
            // that make if you keep copy the same words, this works! just not "1784588"
            if (![pastboardContents isEqualToString:@"1784588"]) {
                //whatever you want runing in backround ,just coding here...
                //                    [self sendNotification: [AppConfig sharedAppConfig].enWord];
                [self getCnDefinition];

                if ([AppConfig sharedAppConfig].cnWord) {
                    NSString *msg = [NSString stringWithFormat:@"%@:%@",[AppConfig sharedAppConfig].enWord,[AppConfig sharedAppConfig].cnWord];
                    [self getCnDefinition];
                    [self sendNotification:msg];
                }
            }
        }
        [UIPasteboard generalPasteboard].string = @"1784588";

        // Wait some time before going to the beginning of the loop
        [NSThread sleepForTimeInterval:0.5];
        //            [self cancelAllNotification];
    }

}


// get the english word's chinese definition
-(void)getCnDefinition {
//    NSString *enWord = [AppConfig sharedAppConfig].enWord;
    NSString *enWord = [UIPasteboard generalPasteboard].string;
    if ( enWord.length == 0 || enWord == nil) {
        NSLog(@"no word to search");
        return;
    }else {

        enWord = [self getWordWithNoSpace:enWord];
        NSDictionary *dic = (NSDictionary*)[FuckHttp get:[NSString stringWithFormat:@"https://api.shanbay.com/bdc/search/?word=%@",enWord]];
        NSLog(@"\n\n%@",dic);
        NSString *cn_definition = (NSString*)[[[dic objectForKey:@"data"] objectForKey:@"cn_definition"] objectForKey:@"defn"];
        [AppConfig sharedAppConfig].cnWord = cn_definition;
       [AppConfig sharedAppConfig].idd = [NSString stringWithFormat:@"%@",[[dic objectForKey:@"data"] objectForKey:@"conent_id"] ];
    }
}
// add word to glossry need your shanbay access token and the word's id
-(void)addNewWord{
    NSString *token = [AppConfig sharedAppConfig].token;
    NSString *idd = [AppConfig sharedAppConfig].idd;
    NSString *addNewWordURL = [NSString stringWithFormat:@"https://api.shanbay.com/bdc/learning/?access_token=%@",token];

    NSDictionary *postDic = @{@"id":idd};
    NSMutableDictionary  *ddd = [[NSMutableDictionary alloc] initWithDictionary:postDic];
    NSDictionary *dic = (NSDictionary*)[FuckHttp post:addNewWordURL postDic:ddd];
    NSLog(@"\n\n%@",dic);
    NSString* msg = (NSString*)[dic objectForKey:@"msg"];
    if ([msg isEqualToString:@"SUCCESS"]) {
        NSLog(@"add succed");
    }else{
        NSLog(@"add failed");
    }
}

-(NSString*)getWordWithNoSpace:(NSString*) wordStr {
    NSString *word = wordStr;
    if (word) {
        while ([word hasSuffix:@" "]) {
            word = [word substringToIndex:([word length]-1)];
        }
    }
    return word;
}
#pragma mark - run in Background and send notification method:
-(void)detectInBackgroundForMintues:(int)looptimesMintues {
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
                [AppConfig sharedAppConfig].enWord = pastboardContents;
                //if pastebaord contents is not "1",then run in side, because I make the pastboard to "1784588" while  every loop end
                // that make if you keep copy the same words, this works! just not "1784588"
                if (![pastboardContents isEqualToString:@"1784588"]) {
//@@@@@@@@@ detected run in here...
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        // 耗时的操作
                        //比如网络请求 string = [request star]；
                        [self getCnDefinition];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // 更新界面
                            // 比如 self.label.text = string;
                            if ([AppConfig sharedAppConfig].cnWord) {
                                NSString *msg = [NSString stringWithFormat:@"%@:%@",[AppConfig sharedAppConfig].enWord,[AppConfig sharedAppConfig].cnWord];
                                [self sendNotification:msg];
                            }
                        });
                    });
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

-(void)pushNotificationAddToGlossary{
    NSString *cnDefinition = [AppConfig sharedAppConfig].cnWord;
    [self sendNotification:cnDefinition];
//    [self performSelectorInBackground:@selector(addNewWord) withObject:nil];
//    [self addNewWord];
}


-(void)sendNotification:(NSString*)msgShowUp{
    //发送通知
    [self cancelAllNotification];
    UILocalNotification *notification = [[UILocalNotification alloc] init];
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

-(void)cancelAllNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


@end
