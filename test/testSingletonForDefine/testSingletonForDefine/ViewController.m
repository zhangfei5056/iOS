//
//  ViewController.m
//  testSingletonForDefine
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "AppConfig.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"\n\n\n\n%@",[AppConfig sharedAppConfig].dataFortest);
    




}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
