//
//  BaseViewController.m
//  testOA
//
//  Created by caoyuan on 8/18/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BaseViewController.h"
#import "FuckHttp.h"
#import "JSON.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSDictionary*)postDicReturnDic:(NSDictionary*)postDic
{
    NSString *muteDicStr = [postDic JSONRepresentation];
    NSDictionary *dic = [FuckHttp postStringReturnDic:@"http://192.168.254.68:12343" postString:muteDicStr];
    return dic;
}

@end
