//
//  ViewController.h
//  BaiduQingpa
//
//  Created by caoyuan on 12/26/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FlatDatePicker;
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *horoscopeLabel;
@property (weak, nonatomic) IBOutlet UILabel *animalLabel;
@property (weak, nonatomic) IBOutlet UILabel *lunarLabel;
@property (nonatomic, strong) FlatDatePicker *flatDatePicker;

-(NSString*)dateToString:(NSDate*)date;
- (IBAction)compartAction:(id)sender;
- (IBAction)tapBackground:(id)sender;

- (IBAction)swipeLeft:(id)sender;



@end

