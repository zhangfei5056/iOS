//
//  ViewController.m
//  CustomButton
//
//  Created by caoyuan on 7/30/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "CYButtion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CYButtion* bt = [[CYButtion alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];

    [bt addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置圆角
    //    bt.layer.cornerRadius = 100;
    //    bt.layer.masksToBounds = YES;

    [bt setBackgroundColor:[UIColor colorWithRed:0.494 green:0.463 blue:0.826 alpha:1.000]];
    [self.view addSubview:bt];
}

- (void)buttonAction:(id)sender
{
    NSLog(@"在❤中");
}

@end
