//
//  BetweenDaysViewController.h
//  BaiduQingpa
//
//  Created by caoyuan on 1/6/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetweenDaysViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *date1TextField;

@property (weak, nonatomic) IBOutlet UITextField *date2TextField;

- (IBAction)compareAction:(id)sender;
- (IBAction)backAcation:(id)sender;
- (IBAction)swipeRight:(id)sender;

@end
