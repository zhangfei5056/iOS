//
//  ViewController.m
//  GCDTesting
//
//  Created by caoyuan on 8/16/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
#import "CYGCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //    [CYGCD doInMainQueue:^{
    //        [self go:@"c"];
    //    }];
    //    dispatch_queue_t urls_queue = dispatch_queue_create("CY", NULL);

    //    dispatch_async(urls_queue, ^{
    //        // your code
    //
    //        [self go:@"a"];
    //
    //    });
    //    dispatch_async(urls_queue, ^{
    //        // your code
    //
    //        [self go:@"b"];
    //
    //    });
    //    dispatch_async(urls_queue, ^{
    //        // your code
    //
    //        [self go:@"c"];
    //
    //    });

    //

//    CYGCD* gcd = [CYGCD sharedCYGCD];
//    CYGCD* gcd2 = [CYGCD sharedCYGCD];
//    [gcd doInCYQueue:^{
//        [self go:@"a"];
//
//    }];
//
//    [gcd doInCYQueue:^{
//        [self go:@"b"];
//        [CYGCD doInMainQueue:^{
//                [self go:@"MAIN"];
//        }];
//    }];
//
//    [gcd2 doInCYQueue:^{
//        [self go:@"c"];
//
//    }];
//    [gcd2 doInCYQueue:^{
//        [self go:@"d"];
//
//    }];
//
    
    
[[CYGCD getCYQueue] doInCYQueue:^{

    [self go:@"a"];
    [[CYGCD getCYQueue] doInMainQueue:^{
        [self go:@"d"];
    }];
}];

    [[CYGCD getCYQueue] doInCYQueue:^{
        
        [self go:@"b"];
    }];
    
    
    [[CYGCD getCYQueue] doInGlobalQueue:^{
 [self go:@"e"];
    }];

    
    [[CYGCD getCYQueue] doInGlobalQueue:^{
        [self go:@"f"];
    }];

}

- (void)go:(NSString*)str
{
    for (NSInteger i = 0; i < 3; i++) {

        NSLog(@"%@=%ld", str, (long)i);
        sleep(1);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
