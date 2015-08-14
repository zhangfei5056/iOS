//
//  ViewController.m
//  study
//
//  Created by caoyuan on 8/13/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "CYTransparencyView.h"
@interface ViewController ()
@property (nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(40, 200, 100, 40)];
    [bt setBackgroundColor:[UIColor redColor]];
    [bt setTitle:@"underButton" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];

    CYTransparencyView *cmView = [[CYTransparencyView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    [cmView setBackgroundColor:[UIColor blueColor]];
    [cmView setAlpha:0.5f];
    cmView.underneathButton = bt;
    [self.view addSubview:cmView];
    
    
    UIButton *bt2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [bt2 setBackgroundColor:[UIColor redColor]];
    [bt2 setTitle:@"top Button" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(btAction2:) forControlEvents:UIControlEventTouchUpInside];
    [cmView addSubview:bt2];
    
    
    
   self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 40)];
    [self.label setTintColor:[UIColor blackColor]];
    
    
    [self.view addSubview:self.label];

    
    
}

- (void)btAction:(id)sender {
    NSLog(@"under button be pressed");
    self.label.text = @"under button";
    
}

- (void)btAction2:(id)sender {
    NSLog(@"top button be pressed");
        self.label.text = @"top button";
}

@end
