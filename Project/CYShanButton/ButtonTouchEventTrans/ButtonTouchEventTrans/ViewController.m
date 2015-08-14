//
//  ViewController.m
//  ButtonTouchEventTrans
//
//  Created by caoyuan on 8/10/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "CYButton.h"
@interface ViewController () 
@property (weak, nonatomic) IBOutlet UIView* contentView;
@property (weak, nonatomic) IBOutlet UIButton* btInView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.

    CYButton *bt = [[CYButton alloc] generateBTWithPoint:self.view point:CGPointMake(100, 200)];
    __weak typeof(bt) weakBt = bt;
    
    bt.bt1Block = ^(id button) {
        NSLog(@"bt1");
        [weakBt close];
        
    };
    bt.bt2Block = ^(id button) {
        NSLog(@"bt2");
        [weakBt close];
    };
    bt.bt3Block = ^(id button) {
        NSLog(@"bt3");
        [weakBt close];
    };
    


}


@end
