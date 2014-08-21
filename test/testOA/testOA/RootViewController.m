//
//  RootViewController.m
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "RootViewController.h"
#import "TableViewController.h"
@interface RootViewController ()<UITextFieldDelegate>
@property (strong,nonatomic)NSString* name;
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.pwdTextField.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btActionForAttenduty:(id)sender {
    self.name = self.userId.text;
    if ([self.name isEqualToString:@""]) {
        self.name = @"caoyuan";
    }
    NSDictionary *selectDiaryDic = @{@"cmd":@"selectAttenDuty", @"name":self.name,@"number":@100};
    TableViewController *vc = [[TableViewController alloc]init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:selectDiaryDic];
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            vc.dataAry = resDic[@"cmd"];
            vc.updateType = @"updateAttenDuty";
            vc.name = self.name;
            //     }
            //            [self presentViewController:vc animated:YES completion:nil];
            [self.navigationController pushViewController:vc animated:YES];
        });
    });
}


- (IBAction)btActionForDiary:(id)sender {
    self.name = self.userId.text;
    if ([self.name isEqualToString:@""]) {
        self.name = @"caoyuan";
    }

    NSDictionary *selectAttenDutyDic = @{@"cmd":@"selectDiary", @"name":self.name,@"number":@100};
    TableViewController *vc = [[TableViewController alloc]init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:selectAttenDutyDic];
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            vc.dataAry = resDic[@"cmd"];
            vc.name = self.name;
            //     }
            vc.updateType = @"updateDiary";
            //            [self presentViewController:vc animated:YES completion:nil];
            [self.navigationController pushViewController:vc animated:YES];
        });
    });

    
}

- (IBAction)btpwdAction:(id)sender {
    [self.pwdTextField resignFirstResponder];
    [self.userId resignFirstResponder];

    if ([self.pwdTextField.text isEqualToString:@"yy"]) {
        self.bt1.hidden = NO;
        self.bt2.hidden = NO;
        self.userId.hidden = NO;
        self.pwdTextField.text = @"";
    }
    else{
        self.pwdTextField.text = @"";
        self.bt1.hidden = YES;
        self.bt2.hidden = YES;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.pwdTextField resignFirstResponder];
    [self.userId resignFirstResponder];
    return YES;
}
- (IBAction)tapBackGround:(id)sender {
    [self.pwdTextField resignFirstResponder];
    [self.userId resignFirstResponder];
}

@end
