//
//  ChangeViewController.m
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

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
    self.timeLabel.text = self.timeStr;
    self.timeTextField.delegate = self;
    self.timeTextField.text = self.timeStr;
    self.time = self.timeStr;
    self.changeTimeButton.titleLabel.text = @"click me !!!";

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeTimeButtonAction:(id)sender {
    [self.timeTextField resignFirstResponder];
    if ([self.cmd isEqualToString:@"updateAttenDuty"]) {
        [self updateAttenDuty];
    }else if([self.cmd isEqualToString:@"updateDiary"]){
        [self updateDiary];
    }
    else {
        return;
    }

}

-(void)updateAttenDuty{

//    NSMutableArray *updateAttenDutyDic = [@{@"cmd":@"updateAttenDuty", @"time":self.time,@"id":self.id} mutableCopy];
 NSMutableArray *updateAttenDutyDic = [@{@"cmd":@"updateAttenDuty", @"time":self.timeTextField.text,@"id":self.id} mutableCopy];

      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:updateAttenDutyDic];
          NSLog(@"%@",resDic);
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            self.timeLabel.text = self.timeTextField.text;
            //     }

            self.changeDone.hidden = NO;

        });
    });

}

-(void)updateDiary{

//    NSDictionary *updateAttenDutyDic = @{@"cmd":@"updateAttenDuty", @"time":self.time,@"id":self.id};
    NSDictionary *updateDiary = @{@"cmd":@"updateDiary", @"time":self.timeTextField.text,@"id":self.id};

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //     background doing {
        NSDictionary *resDic = [self postDicReturnDic:updateDiary];
        //     }
        dispatch_async(dispatch_get_main_queue(), ^{
            //     main thread doing {
            self.timeLabel.text = self.timeTextField.text;
            //     }

            self.changeDone.hidden = NO;

        });
    });
    
}


#pragma mark - textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.timeTextField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.picc.hidden = YES;
          self.changeDone.hidden = YES;

}

- (IBAction)changDoneBTAction:(id)sender {
    self.picc.hidden = NO;
}
@end
