//
//  ChangeViewController.h
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BaseViewController.h"

@interface ChangeViewController : BaseViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
- (IBAction)changeTimeButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong,nonatomic)NSString* timeStr;
@property(strong,nonatomic)NSString* time;
@property(strong,nonatomic)NSString* id;
@property (weak, nonatomic) IBOutlet UIImageView *picc;
@property (weak, nonatomic) IBOutlet UIButton *changeTimeButton;
@property(strong,nonatomic)NSString* cmd;
@property (weak, nonatomic) IBOutlet UIButton *changeDone;
- (IBAction)changDoneBTAction:(id)sender;

@end
