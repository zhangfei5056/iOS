//
//  BetweenDaysViewController.m
//  BaiduQingpa
//
//  Created by caoyuan on 1/6/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "BetweenDaysViewController.h"
#import "FlatDatePicker.h"
#import "UIView+FastAnimation.h"
@interface BetweenDaysViewController ()<FlatDatePickerDelegate,UITextFieldDelegate>
{
    BOOL _date1ButtonChose;
    BOOL _date2ButtonChose;
}
@property (nonatomic,strong)FlatDatePicker *flatDatePicker;
@end

@implementation BetweenDaysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _date1ButtonChose = NO;
    _date2ButtonChose = NO;
    NSDate *now = [NSDate date];
    self.date1TextField.text = [self dateToString:now];
    self.date2TextField.text = [self dateToString:now];
    self.date1TextField.delegate = self;
    self.date2TextField.delegate = self;
    [self setUpDatePicker];

}




//计算两天时间
-(NSString *)howLongBetween2day:(NSString*)dateStr  date2:(NSString*)dateStr2 {
    
    NSDate *date2 = [self stringToDate:dateStr];
    NSDate *date1 = [self stringToDate:dateStr2];
    
    NSTimeInterval timeBetween = [date1 timeIntervalSinceDate:date2];
    timeBetween = timeBetween/60/60/24;
    NSString *days = [NSString stringWithFormat:@"between %d days",(int)timeBetween];
    return days;
}
//1、字符串转换为日期
-(NSDate*)stringToDate:(NSString*)dateString{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    //    NSDate *date =[dateFormat dateFromString:@"1980-01-01"];
    NSDate *date =[dateFormat dateFromString:dateString];
    return date;
}
//2、日期转换为字符串
-(NSString*)dateToString:(NSDate*)date{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormat stringFromDate:date];
    return currentDateStr;
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

- (IBAction)compareAction:(id)sender {
    self.resultLabel.text = [self howLongBetween2day:self.date1TextField.text date2:self.date2TextField.text];
    [self viewComeOut:self.resultLabel delayTime:0.0];
}

- (IBAction)backAcation:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.modalTransitionStyle = 2;
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (IBAction)swipeRight:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)touchView:(id)sender {
//    NSLog(@"ddfdf");
    [self.flatDatePicker dismiss];
//    [self.view endEditing:YES];
}

-(void)setUpDatePicker {
    self.flatDatePicker                = [[FlatDatePicker alloc] initWithParentView:self.view];
    self.flatDatePicker.delegate       = self;
    self.flatDatePicker.datePickerMode = FlatDatePickerModeDate;
    self.flatDatePicker.title          = @"Pick up a day ：）";
    NSDate *maxDate                    = [self stringToDate:@"2200-12-31"];
    NSDate *minDate                    = [self stringToDate:@"1800-01-01"];
    [self.flatDatePicker setMaximumDate:maxDate];
    [self.flatDatePicker setMinimumDate:minDate];
//    [self.flatDatePicker show];
}
#pragma mark - Flatdatepicker delegate

- (void)flatDatePicker:(FlatDatePicker*)datePicker dateDidChange:(NSDate*)date {
    

    

    
    //     GCD start ----
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing start--------
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        
        if (datePicker.datePickerMode == FlatDatePickerModeDate) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        } else if (datePicker.datePickerMode == FlatDatePickerModeTime) {
            [dateFormatter setDateFormat:@"HH:mm:ss"];
        } else {
            [dateFormatter setDateFormat:@"dd MMMM yyyy HH:mm:ss"];
        }
        
        

        //     background doing over--------
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing start-----
            //     main thread doing over-----
        });
        
        
    });
    // GCD over ----
    NSString *dateStr = [self dateToString:date];
    
//    NSLog(@"%@",dateStr);
    if (_date1ButtonChose) {
        self.date1TextField.text = dateStr;
    }else if (_date2ButtonChose) {
        self.date2TextField.text = dateStr;
    }
    else {
        NSLog(@"no");
    }
    
    
    self.resultLabel.text = [self howLongBetween2day:self.date1TextField.text date2:self.date2TextField.text];
    [self viewComeOut:self.resultLabel delayTime:0.0];
    

}



//UIView animation
-(void)viewComeOut:(UIView*)view delayTime:(float)time{
    view.hidden = NO;
    view.animationType = @"Shake";
    view.delay = time;
//    view.animationParams[@"velocity"] = @40;
    view.startAnimationWhenAwakeFromNib = NO;
    [view startFAAnimation];
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [self.flatDatePicker show];
//    textField.text =    [self dateToString:self.flatDatePicker.getDate];
    return NO;
}

- (IBAction)date1ButtonAction:(id)sender {
    _date1ButtonChose = YES;
    _date2ButtonChose = NO;
    [self viewComeOut:self.date1TextField delayTime:0];
    [self.flatDatePicker show];
    
}
- (IBAction)date2ButtonAction:(id)sender {
    _date1ButtonChose = NO;
    _date2ButtonChose = YES;
    [self viewComeOut:self.date2TextField delayTime:0];
    [self.flatDatePicker show];
}


@end
