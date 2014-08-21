//
//  ViewController.m
//  testOA
//
//  Created by caoyuan on 8/17/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{


}
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btActionForDiary:(id)sender {
   NSDictionary *selectAttenDutyDic = @{@"cmd":@"selectAttenDuty", @"name":@"liran",@"number":@30};

    TableViewController *vc = [[TableViewController alloc]init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:selectAttenDutyDic];
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            vc.dataAry = resDic[@"cmd"];
            //     }
            [self presentViewController:vc animated:YES completion:nil];
        });
    });


}
- (IBAction)btActionForAttenDuty:(id)sender {

    NSDictionary *selectDiaryDic = @{@"cmd":@"selectDiary", @"name":@"liran",@"number":@30};
     TableViewController *vc = [[TableViewController alloc]init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:selectDiaryDic];
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            vc.dataAry = resDic[@"cmd"];
            //     }
            [self presentViewController:vc animated:YES completion:nil];
        });
    });

}
@end
