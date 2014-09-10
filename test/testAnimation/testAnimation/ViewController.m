//
//  ViewController.m
//  testAnimation
//
//  Created by caoyuan on 9/10/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btAction:(id)sender {


//    [self viewAnimaton:0.7 view:self.anView animations:^(UIView * view) {
//        CGRect frame = view.frame;
//        frame.origin.y += 200;
//        view.frame = frame;
//    } whenFinished:^(UIView * view) {
//        CGRect frame = view.frame;
//        frame.origin.y -= 200;
//        view.frame = frame;
//    }];
    [self viewAnimaton:0.7 view:self.anView animations:^(UIView * view) {
        CGRect frame = view.frame;
        frame.origin.y += 200;
        view.frame = frame;
        view.alpha = 0.1;
//        view 得形状长款改变为原来得0.01倍
        view.transform = CGAffineTransformScale(view.transform, 0.01, 0.01);
    } whenFinished:^(UIView * view){
        NSLog(@"finished");
        //view 得形状复原
        view.transform = CGAffineTransformIdentity;
    }];
}

-(void)viewAnimaton:(float)time
               view:(UIView*)anView
         animations:(void(^)(UIView*))animations
       whenFinished:(void(^)(UIView*))completion
{
    [UIView animateWithDuration:time animations:^(){
        animations(anView);
    } completion:^(BOOL finished){
        if (finished) {
            [UIView animateWithDuration:time animations:^{
                completion(anView);
            }];
        }
    }];
}





-(void)moveViewToXandY:(UIView*)view
            duringTime:(float)time
                 X:(float)x
                 Y:(float)y
    whenFinishedDo:(void(^)(void))completion

{
    [UIView animateWithDuration:time animations:^(){
        NSLog(@"begin");
        CGRect frame = view.frame;
        frame.origin.y = y;
        frame.origin.x = x;
        view.frame = frame;
    } completion:^(BOOL finished) {
        if (finished) {
            completion();

        }
    }];
}

-(void)moveViewToXandY:(UIView*)view
            duringTime:(float)time
                     X:(float)x
                     Y:(float)y

{
    [UIView animateWithDuration:time animations:^(){
        NSLog(@"begin");
        CGRect frame = view.frame;
        frame.origin.y = y;
        frame.origin.x = x;
        view.frame = frame;
    }];
}





@end
