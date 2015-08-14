//
//  ViewController.m
//  CALayer
//
//  Created by caoyuan on 7/28/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Block.h"
@interface ViewController () {
    CALayer* layer;
    CALayer* layer2;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    

  
    
    
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.884 blue:0.716 alpha:1.000];
    // Do any additional setup after loading the view, typically from a nib.
    layer = [CALayer layer];
    layer.frame = CGRectMake(0, 100, 300, 10);
    //    layer.position = CGPointMake(, 100);
    layer.backgroundColor = [UIColor colorWithRed:0.998 green:1.000 blue:0.971 alpha:1.000].CGColor;
    layer.borderColor = [UIColor blackColor].CGColor;
    layer.borderWidth = 2.0f;
    layer.opacity = 1.0f;
    [self.view.layer addSublayer:layer];

    layer2 = [CALayer layer];
    layer2.frame = CGRectMake(0, 102, 0, 8);
    layer2.backgroundColor = [UIColor colorWithRed:1.000 green:0.294 blue:0.648 alpha:1.000].CGColor;
    layer2.borderColor = [UIColor blackColor].CGColor;
    layer2.opacity = 1.0f;
    [self.view.layer addSublayer:layer2];
    
    
    
    
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 100, 40)];
    [bt setTitle:@"buttonBlock" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bt handleControlEvent:UIControlEventTouchDown withBlock:^{
        NSLog(@"222222");
    }];
    [bt handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"666666");
    }];

    
//    [bt addTarget:self action:@selector(aaa:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [bt addTarget:self action:@selector(bbb:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:bt];

}


- (void)aaa:(id)sender {
     NSLog(@"666666");
}

- (void)bbb:(id)sender {
     NSLog(@"222222");
}

- (IBAction)bt:(id)sender

{

    [CATransaction begin];

    //显式事务默认开启动画效果,kCFBooleanTrue关闭
    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];

    //动画执行时间
    [CATransaction setValue:[NSNumber numberWithFloat:2.0f] forKey:kCATransactionAnimationDuration];

    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
    layer2.frame = CGRectMake(0, 102, 200, 6);

    [CATransaction commit];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction begin];

        //显式事务默认开启动画效果,kCFBooleanTrue关闭
        [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];

        //动画执行时间
        [CATransaction setValue:[NSNumber numberWithFloat:2.0f] forKey:kCATransactionAnimationDuration];

        //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
        layer2.frame = CGRectMake(0, 102, 20, 6);

        
        [CATransaction commit];
    });
    
    

    
}










@end
