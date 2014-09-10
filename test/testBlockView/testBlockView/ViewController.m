//
//  ViewController.m
//  testBlockView
//
//  Created by caoyuan on 9/9/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "ViewController.h"
#import "BlockView.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlockView *cmView = [[BlockView alloc] initFromNib];
    cmView.frame = CGRectMake(20, 100, 200, 200);
    cmView.MyBlock = ^(){
        NSLog(@"this myBlock");
    };
    [self.view addSubview:cmView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
