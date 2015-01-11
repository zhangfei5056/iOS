//
//  ViewController.m
//  BaiduQingpa
//
//  Created by caoyuan on 12/26/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "BetweenDaysViewController.h"
#import "FlatDatePicker.h"
#import "UIView+FastAnimation.h"
@interface ViewController ()<FlatDatePickerDelegate,UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDate *nowDate = [NSDate new];
    NSString *nowDateStr = [self dateToString:nowDate];
    self.dateLabel.text = [nowDateStr substringToIndex:10];
//    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.modalTransitionStyle = 2;
//        [self dismissViewControllerAnimated:YES completion:nil];
        [self setUpDatePicker];
//    });
//    self.dateLabel.hidden = YES;
//    self.horoscopeLabel.hidden = YES;
//    self.animalLabel.hidden = YES;
//    self.lunarLabel.hidden = YES;
}

//-(void)test {
//    
//    NSDate *date1 = [self stringToDate:@"1987-08-09"];
//    NSDate *date2 = [self stringToDate:@"2000-08-09"];
//    NSDate *data = [self stringToDate:@"2999-08-02"];
//    [self dateInRange:data date1:date1 date2:date2];
//
//}

-(void)test {
    NSDate *date1 = [self stringToDateOnlyMonth:@"02-09"];
    NSDate *date2 = [self stringToDateOnlyMonth:@"08-09"];
    NSDate *data = [self stringToDateOnlyMonth:@"08-02"];
    NSLog(@"%@----",data);
    [self dateInRange:data date1:date1 date2:date2];
    
}

-(BOOL)dateInRange:(NSDate*)date date1:(NSDate*)date1 date2:(NSDate*)date2 {

    NSComparisonResult result1 = [date compare:date1];
    NSComparisonResult result2 = [date compare:date2];

    if ((1 == result1 && -1 == result2)|| (0 == result1)  || (0==result2)) {
//        NSLog(@"in");

        return YES;
    }else {
//                NSLog(@"not in");
        return NO;
    }
    
}



//-(void)dateChanged:(id)sender{
//    UIDatePicker* control = (UIDatePicker*)sender;
//    NSDate* _date = control.date;
//    
//    self.dateLabel.text = [self dateToString:_date];
//    
//    NSDate *date1 = [self stringToDate:@"1987-08-09"];
//    NSDate *date2 = [self stringToDate:@"2000-08-09"];
//    NSDate *data = [self stringToDate:self.dateLabel.text];
//    [self dateInRange:data date1:date1 date2:date2];
//
//}
//
//-(void)dateChanged:(id)sender{
//    UIDatePicker* control = (UIDatePicker*)sender;
//    NSDate* _date = control.date;
//
//    self.dateLabel.text = [self dateToString:_date];
//
////    NSDate *date1 = [self stringToDateOnlyMonth:@"07-09"];
////    NSDate *date2 = [self stringToDateOnlyMonth:@"10-09"];
//    NSDate *date = [self getMonth:self.dateLabel.text];
////    [self dateInRange:date date1:date1 date2:date2];
////NSLog(@"%@",    [self Horoscope:date]);
//    self.horoscopeLabel.text = [self Horoscope:date];
//    NSString* year = [self.dateLabel.text substringToIndex:4];
//    NSLog(@"%@",year);
//    self.animalLabel.text =  [self searchBirthdayAnimal:[year intValue]];
//
//
//
//    @try {
//        self.lunarLabel.text = [self LunarForSolarYear:self.dateLabel.text];
//        
//    }
//    @catch (NSException *exception) {
//  self.lunarLabel.text = @"今年木的农历";
//    }
//    @finally {
//
//        
//    }
//
//
//}

-(NSString*)Horoscope:(NSDate*)date {
    
    
    NSDate *dateAries = [self stringToDateOnlyMonth:@"03-21"];
    NSDate *dateAries_ = [self stringToDateOnlyMonth:@"04-19"];
    
    NSDate *dateTaurus = [self stringToDateOnlyMonth:@"04-20"];
    NSDate *dateTaurus_ = [self stringToDateOnlyMonth:@"05-20"];
    
    NSDate *dateGemini = [self stringToDateOnlyMonth:@"05-21"];
    NSDate *dateGemini_ = [self stringToDateOnlyMonth:@"06-21"];
    
    NSDate *dateCancer = [self stringToDateOnlyMonth:@"06-22"];
    NSDate *dateCancer_ = [self stringToDateOnlyMonth:@"07-22"];
    
    NSDate *dateLeo = [self stringToDateOnlyMonth:@"07-23"];
    NSDate *dateLeo_ = [self stringToDateOnlyMonth:@"08-22"];
    
    NSDate *dateVirgo = [self stringToDateOnlyMonth:@"08-23"];
    NSDate *dateVirgo_ = [self stringToDateOnlyMonth:@"09-23"];
    
    NSDate *dateLibra = [self stringToDateOnlyMonth:@"09-23"];
    NSDate *dateLibra_ = [self stringToDateOnlyMonth:@"10-23"];
    
    NSDate *dateScorpio = [self stringToDateOnlyMonth:@"10-24"];
    NSDate *dateScorpio_ = [self stringToDateOnlyMonth:@"11-22"];
    
    NSDate *dateSagittarius = [self stringToDateOnlyMonth:@"11-23"];
    NSDate *dateSagittarius_ = [self stringToDateOnlyMonth:@"12-21"];
    
//    NSDate *dateCapricorn = [self stringToDateOnlyMonth:@"12-22"];
//    NSDate *dateCapricorn_ = [self stringToDateOnlyMonth:@"01-19"];
    
    NSDate *dateAquarius = [self stringToDateOnlyMonth:@"01-20"];
    NSDate *dateAquarius_ = [self stringToDateOnlyMonth:@"02-18"];
    
    NSDate *datePisces = [self stringToDateOnlyMonth:@"02-19"];
    NSDate *datePisces_ = [self stringToDateOnlyMonth:@"03-20"];
    

    
    if ([self dateInRange:date date1:dateAries date2:dateAries_]) {
        NSString *str = @"Aries: Leo Sagittarius Gemini";
        return str;
    }
    else if ([self dateInRange:date date1:dateTaurus date2:dateTaurus_]) {
        NSString *str = @"Taurus: Capricorn Virgo Cancer";
        return str;
    }
    else if ([self dateInRange:date date1:dateGemini date2:dateGemini_]) {
        NSString *str = @"Gemini: Libra Aquarius Leo";
        return str;
    }
    else if ([self dateInRange:date date1:dateCancer date2:dateCancer_]) {
        NSString *str = @"Cancer: Pisces Scorpio Taurus";
        return str;
    }
    else if ([self dateInRange:date date1:dateLeo date2:dateLeo_]) {
        NSString *str = @"Leo: Aries Sagittarius Gemini";
        return str;
    }
    else if ([self dateInRange:date date1:dateVirgo date2:dateVirgo_]) {
        NSString *str = @"Virgo: Taurus Capricorn Scorpio";
        return str;
    }
    else if ([self dateInRange:date date1:dateLibra date2:dateLibra_]) {
        NSString *str = @"Libra: Gemini Aquarius Leo";
        return str;
    }
    else if ([self dateInRange:date date1:dateScorpio date2:dateScorpio_]) {
        NSString *str = @"Scorpio: Cancer Pisces Capricorn";
        return str;
    }
    else if ([self dateInRange:date date1:dateSagittarius date2:dateSagittarius_]) {
        NSString *str = @"Sagittarius: Aries Leo Libra";
        return str;
    }
//    else if ([self dateInRange:date date1:dateCapricorn date2:dateCapricorn_]) {
//        NSString *str = @"摩羯 Capricorn";
//        return str;
//    }
    else if ([self dateInRange:date date1:dateAquarius date2:dateAquarius_]) {
        NSString *str = @"Aquarius: Gemini Libra Aries";
        return str;
    }
    else if ([self dateInRange:date date1:datePisces date2:datePisces_]) {
        NSString *str = @"Pisces: Cancer Scorpio Capricorn";
        return str;
    }
    else {
        NSString *str =  @"Capricorn: Taurus Virgo Pisces";
        return str;
    }

    
}


//UIView animation
-(void)viewComeOut:(UIView*)view delayTime:(float)time{
    view.hidden = NO;
    view.animationType = @"BounceLeft";
    view.delay = time;
    view.animationParams[@"velocity"] = @40;
    view.startAnimationWhenAwakeFromNib = NO;
    [view startFAAnimation];
}

//查询生效

- (NSString*)searchBirthdayAnimal:(NSInteger)year {
    
    switch (year%12) {
        case 7: {
            NSString *str = @"Hare, Rabbit articulate";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 8: {
            NSString *str = @"Dragon, Deagon healthy";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 9: {
            NSString *str = @"Snake, Snake deep";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 10: {
            NSString *str = @"Horse, Horse popular";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 11: {
            NSString *str = @"Sheep, Goat elegant";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 0: {
            NSString *str = @"Monkey, Monkey clever";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 1: {
            NSString *str = @"Cock, Rooster thinkers";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 2: {
            NSString *str = @"Dog, Dog loyalty";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 3: {
            NSString *str = @"Boar, Pig chivalrous";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 4: {
            NSString *str = @"Rat, Rat charm";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 5: {
            NSString *str = @"Ox, Ox patient";
            NSLog(@"%@",str);
            return str;
            break;
        }
        case 6: {
            NSString *str = @"Tiger, Tiger sensitive";
            NSLog(@"%@",str);
            return str;
            break;
        }
            
            
        default:{
            NSString *str = @"nothing";
            NSLog(@"%@",str);
            return str;
            break;
        }
    }
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

- (IBAction)compartAction:(id)sender {
    BetweenDaysViewController *vc = [[BetweenDaysViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)tapBackground:(id)sender {
    NSLog(@".......");
        [self.flatDatePicker show];
}

- (IBAction)swipeLeft:(id)sender {
    BetweenDaysViewController *vc = [[BetweenDaysViewController alloc] init];
//    vc.modalTransitionStyle = 2;
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


//3、字符串转换只有月份
-(NSDate*)stringToDateOnlyMonth:(NSString*)dateString{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    //    NSDate *date =[dateFormat dateFromString:@"1980-01-01"];
    NSDate *date =[dateFormat dateFromString:dateString];
    return date;
}

-(NSDate*)getMonth:(NSString*)time {
//    NSString *time = @"1999-09-02";
    NSRange range = NSMakeRange (5, 5);
    NSString *str = [time substringWithRange:range];
    return [self stringToDateOnlyMonth:str];

}
//阳历转农历
-(NSString *)LunarForSolarYear:(NSString*)str {
    
    int wCurYear = [[str substringWithRange:NSMakeRange(0,4)] intValue];
    int wCurMonth =[[str substringWithRange:NSMakeRange(5,2)] intValue];
    int wCurDay =[[str substringWithRange:NSMakeRange(8,2)] intValue];
    
    
    
    
    
    //农历日期名
    NSArray *cDayName =  [NSArray arrayWithObjects:@"*",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",
                          @"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",
                          @"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",nil];
    
    //农历月份名
    NSArray *cMonName =  [NSArray arrayWithObjects:@"*",@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Seven",@"Eight",@"Nine",@"Ten",@"Eleven",@"Twelve",nil];
    
    //公历每月前面的天数
    const int wMonthAdd[12] = {0,31,59,90,120,151,181,212,243,273,304,334};
    
    //农历数据
    const int wNongliData[100] = {2635,333387,1701,1748,267701,694,2391,133423,1175,396438
        ,3402,3749,331177,1453,694,201326,2350,465197,3221,3402
        ,400202,2901,1386,267611,605,2349,137515,2709,464533,1738
        ,2901,330421,1242,2651,199255,1323,529706,3733,1706,398762
        ,2741,1206,267438,2647,1318,204070,3477,461653,1386,2413
        ,330077,1197,2637,268877,3365,531109,2900,2922,398042,2395
        ,1179,267415,2635,661067,1701,1748,398772,2742,2391,330031
        ,1175,1611,200010,3749,527717,1452,2742,332397,2350,3222
        ,268949,3402,3493,133973,1386,464219,605,2349,334123,2709
        ,2890,267946,2773,592565,1210,2651,395863,1323,2707,265877};
    
    static int nTheDate,nIsEnd,m,k,n,i,nBit;
    
    
    //计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth - 1] - 38;
    
    if((!(wCurYear % 4)) && (wCurMonth > 2))
        nTheDate = nTheDate + 1;
    
    //计算农历天干、地支、月、日
    nIsEnd = 0;
    m = 0;
    while(nIsEnd != 1)
    {
        if(wNongliData[m] < 4095)
            k = 11;
        else
            k = 12;
        n = k;
        while(n>=0)
        {
            //获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m];
            for(i=1;i<n+1;i++)
                nBit = nBit/2;
            
            nBit = nBit % 2;
            
            if (nTheDate <= (29 + nBit))
            {
                nIsEnd = 1;
                break;
            }
            
            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        }
        if(nIsEnd)
            break;
        m = m + 1;
    }
    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = nTheDate;
    if (k == 12)
    {
        if (wCurMonth == wNongliData[m] / 65536 + 1)
            wCurMonth = 1 - wCurMonth;
        else if (wCurMonth > wNongliData[m] / 65536 + 1)
            wCurMonth = wCurMonth - 1;
    }
    
    
    //生成农历月
    NSString *szNongliMonth;
    if (wCurMonth < 1){
        szNongliMonth = [NSString stringWithFormat:@"Double %@",(NSString *)[cMonName objectAtIndex:-1 * wCurMonth]];
    }else{
        szNongliMonth = (NSString *)[cMonName objectAtIndex:wCurMonth];
    }
    
    //生成农历日
    NSString *szNongliDay              = [cDayName objectAtIndex:wCurDay];

    //合并
    NSString *lunarDate                = [NSString stringWithFormat:@"Lunar：%@ Month %@",szNongliMonth,szNongliDay];
    NSLog(@"《%@》",lunarDate);
    return lunarDate;
}
// set  up  FlatDatePicker
-(void)setUpDatePicker {
    self.flatDatePicker                = [[FlatDatePicker alloc] initWithParentView:self.view];
    self.flatDatePicker.delegate       = self;
    self.flatDatePicker.datePickerMode = FlatDatePickerModeDate;
    self.flatDatePicker.title          = @"Pick up her Birthday";
    NSDate *maxDate                    = [self stringToDate:@"2200-12-31"];
    NSDate *minDate                    = [self stringToDate:@"1800-01-01"];
    [self.flatDatePicker setMaximumDate:maxDate];
    [self.flatDatePicker setMinimumDate:minDate];
    [self.flatDatePicker show];
}

#pragma mark - Flatdatepicker delegate

- (void)flatDatePicker:(FlatDatePicker*)datePicker dateDidChange:(NSDate*)date {

    //
    dispatch_async(dispatch_get_main_queue(), ^{
//
        [self viewComeOut:self.dateLabel delayTime:0.0];
        [self viewComeOut:self.lunarLabel delayTime:0.2];
        [self viewComeOut:self.horoscopeLabel delayTime:0.4];
        [self viewComeOut:self.animalLabel delayTime:0.6];

    });
 
    
    __block NSString  *dateLabelString      = nil;
    __block NSString  *horoscopeLabelString = nil;
    __block NSString  *animalLabelString    = nil;
    __block NSString  *lunarLabelString    = nil;
    
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
        
        
        dateLabelString      = [dateFormatter stringFromDate:date];
        NSDate *_date        = [self getMonth:dateLabelString];
        horoscopeLabelString = [self Horoscope:_date];
        NSString* year       = [self.dateLabel.text substringToIndex:4];
        animalLabelString    = [self searchBirthdayAnimal:[year intValue]];
        @try {
            lunarLabelString = [self LunarForSolarYear:dateLabelString];
        }
        @catch (NSException *exception) {
            lunarLabelString = @"No Lunar this year";
        }
        @finally {
            
        }
        //     background doing over--------
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing start-----
            self.dateLabel.text      = dateLabelString;
            self.horoscopeLabel.text = horoscopeLabelString;
            self.animalLabel.text    = animalLabelString;
            self.lunarLabel.text = lunarLabelString;
            //     main thread doing over-----
        });
    });
    // GCD over ----

    
}


#pragma mark - block GCD
-(void)dispatchBlockFromBackgroundMethodToFrontMethod:(void(^)(void))backgroundBlock doSomethingInFront:(void (^)(void))frontBlock {
    // GCD start ----
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing start--------
        backgroundBlock();
        //     background doing over--------
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing start-----
            frontBlock();
            //     main thread doing over-----
        });
    });
    // GCD over ----
}



@end
