//
//  RootViewController.h
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BaseViewController.h"

@interface RootViewController : BaseViewController<UITextFieldDelegate>
- (IBAction)btActionForDiary:(id)sender;

- (IBAction)btActionForAttenduty:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bt1;
@property (weak, nonatomic) IBOutlet UIButton *bt2;
- (IBAction)btpwdAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *happyBT;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *userId;

@end
