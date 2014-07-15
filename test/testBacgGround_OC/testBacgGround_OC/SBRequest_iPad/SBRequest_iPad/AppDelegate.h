//
//  AppDelegate.h
//  SBRequest_iPad
//
//  Created by caoyuan on 7/15/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int _count;
    UIBackgroundTaskIdentifier _taskId;

}
@property (strong, nonatomic) UIWindow *window;
@end

