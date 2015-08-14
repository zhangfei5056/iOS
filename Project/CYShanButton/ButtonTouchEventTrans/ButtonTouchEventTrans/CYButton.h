//
//  CYButton.h
//  ButtonTouchEventTrans
//
//  Created by caoyuan on 8/11/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CYShanButtonBlock)(id result);

@interface CYButton : UIButton

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;


- (void)open;
- (void)close;






- (instancetype)generateBTWithFrame:(UIView*)view point:(CGRect)frame;
- (instancetype)generateBTWithPoint:(UIView*)view point:(CGPoint)point;

@property (copy, nonatomic) CYShanButtonBlock bt1Block;
@property (copy, nonatomic) CYShanButtonBlock bt2Block;
@property (copy, nonatomic) CYShanButtonBlock bt3Block;


@end
