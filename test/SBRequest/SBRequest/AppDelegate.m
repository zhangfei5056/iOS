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
//when this app begin, this method will NSlog per second to show the background time remaining.
-(void)timerActionFront:(NSTimer*)timer{
    NSLog(@"---this log can not run in background unless you support it---");
    int d = [[[UIApplication sharedApplication] valueForKey:@"backgroundTimeRemaining"] floatValue];
    NSLog(@"%d remaining",d);
}
//this method will restart your backgound task every 10 second..
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

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //form 'this line' to 'Do the task' line ,new a thread keep call timeAction; to hold application active in background.
    //start background method..
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
        //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ add method you want run in background here..
        [self detectPasterboardChangeInBackground:60];
        // End the task
        [application endBackgroundTask:_taskId];
    });
}

#pragma mark - detect UIPasterboard in backgourd method:

-(void)detectPasterboardChangeInBackground:(int)looptimsMinute{
    int time = looptimsMinute*60*2;
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
                //                    [self sendNotification: [AppConfig sharedAppConfig].enWord];
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
                            [self addNewWord];
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

}

#pragma mark - ShanBay methods
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
#pragma mark - send notification method:
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
