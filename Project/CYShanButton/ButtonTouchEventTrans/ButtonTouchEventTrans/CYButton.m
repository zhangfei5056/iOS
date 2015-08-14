//
//  CYButton.m
//  ButtonTouchEventTrans
//
//  Created by caoyuan on 8/11/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "CYButton.h"
#import <pop/POP.h>
#define OPEN YES
#define CLOSE NO
@interface CYButton () {
    BOOL buttonStatus;
    int x;
    int y;
    CGPoint _point;
}
@end

@implementation CYButton

- (instancetype)generateBTWithFrame:(UIView*)view point:(CGRect)frame
{
    CYButton* bt = [self initWithFrame:frame];
    [view addSubview:bt];
    return bt;
}

- (instancetype)generateBTWithPoint:(UIView*)view point:(CGPoint)point
{
    CYButton* bt = [self initWithFrame:CGRectMake(0, 0, 40, 40)];
    bt.center = point;
    [view addSubview:bt];
    _point = point;

    self.button1 = [[UIButton alloc] init];
    self.button2 = [[UIButton alloc] init];
    self.button3 = [[UIButton alloc] init];
    [self.button1 setImage:[UIImage imageNamed:@"nuomi"] forState:UIControlStateNormal];
    [self.button2 setImage:[UIImage imageNamed:@"qunaer"] forState:UIControlStateNormal];
    [self.button3 setImage:[UIImage imageNamed:@"waimai"] forState:UIControlStateNormal];
    self.button1.frame = CGRectMake(0, 0, 28, 28);
    self.button2.frame = CGRectMake(0, 0, 28, 28);
    self.button3.frame = CGRectMake(0, 0, 28, 28);
    self.button1.center = point;
    self.button2.center = point;
    self.button3.center = point;

    [self.button1 addTarget:self action:@selector(bt1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(bt2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(bt3Action:) forControlEvents:UIControlEventTouchUpInside];

    buttonStatus = CLOSE;
    [self.button1 setHidden:YES];
    [self.button2 setHidden:YES];
    [self.button3 setHidden:YES];
    x = 60, y = 60;
    CGPoint center = point;
    self.button1.center = CGPointMake(center.x, center.y);
    self.button2.center = CGPointMake(center.x, center.y);
    self.button3.center = CGPointMake(center.x, center.y);

    [view addSubview:self.button1];
    [view addSubview:self.button1];
    [view addSubview:self.button2];
    [view addSubview:self.button3];

    return bt;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setImage:[UIImage imageNamed:@"position"] forState:UIControlStateNormal];

        [self addTarget:self action:@selector(shanButtonShow:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)shanButtonShow:(id)sender
{
    if (buttonStatus == CLOSE) {
        //        弹出去
        [self open];
    }
    else {
        //        收起来
        [self close];
    }
}

// 弹出去
- (void)open
{
    buttonStatus = OPEN;
    POPSpringAnimation* scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    POPSpringAnimation* scaleAnimationCenter = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    POPSpringAnimation* positionAnimation1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    POPSpringAnimation* positionAnimation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    POPSpringAnimation* positionAnimation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];

    [self.button1 setHidden:NO];
    [self.button2 setHidden:NO];
    [self.button3 setHidden:NO];


    //        大小
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.5, 1.5)];
    scaleAnimation.springBounciness = 20.f;

    [self.button1.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];
    [self.button2.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];
    [self.button3.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];

    scaleAnimationCenter.toValue = [NSValue valueWithCGSize:CGSizeMake(2, 2)];
    scaleAnimationCenter.springBounciness = 16;
    scaleAnimationCenter.springSpeed = 20;

    [self.layer pop_addAnimation:scaleAnimationCenter forKey:@"scaleXY"];

    // 位移
  
    positionAnimation1.toValue = [NSValue valueWithCGPoint:CGPointMake(_point.x - x, _point.y - y)];
    positionAnimation1.springBounciness = 16;
    positionAnimation1.springSpeed = 6;

    positionAnimation2.toValue = [NSValue valueWithCGPoint:CGPointMake(_point.x + x, _point.y - y)];
    positionAnimation2.springBounciness = 16;
    positionAnimation2.springSpeed = 6;

    positionAnimation3.toValue = [NSValue valueWithCGPoint:CGPointMake(_point.x, _point.y + y + 10)];
    positionAnimation3.springBounciness = 16;
    positionAnimation3.springSpeed = 6;
    [self.button1 pop_addAnimation:positionAnimation1 forKey:@"center"];
    [self.button2 pop_addAnimation:positionAnimation2 forKey:@"center"];
    [self.button3 pop_addAnimation:positionAnimation3 forKey:@"center"];
}
// 收起来
- (void)close
{
    buttonStatus = CLOSE;
    POPSpringAnimation* scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    POPSpringAnimation* scaleAnimationCenter = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    //    POPSpringAnimation* positionAnimation1 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //    POPSpringAnimation* positionAnimation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    POPSpringAnimation* positionAnimation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //        收起来
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.001, 0.001)];
    scaleAnimation.springBounciness = 0;
    scaleAnimation.springSpeed = 20;

    scaleAnimationCenter.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    scaleAnimationCenter.springBounciness = 10;
    scaleAnimationCenter.springSpeed = 20;

    [self.layer pop_addAnimation:scaleAnimationCenter forKey:@"scaleXY"];

    scaleAnimation.completionBlock = ^(POPAnimation* anim, BOOL finished) {
        if (finished) {
            [self.button1 setHidden:YES];
            [self.button2 setHidden:YES];
            [self.button3 setHidden:YES];

            self.button1.center = _point;
            self.button2.center = _point;
            self.button3.center = _point;

            [self.layer pop_addAnimation:scaleAnimationCenter forKey:@"scaleXY"];
        }
    };

    [self.button1.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];
    [self.button2.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];
    [self.button3.layer pop_addAnimation:scaleAnimation forKey:@"scaleXY"];
}
#pragma mark - delegate method
- (void)bt1Action:(id)sender
{
    if (self.bt1Block != nil) {
        self.bt1Block(sender);
    }
    //    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(bt1Pressed:)]) {
    //        [self.delegate bt1Pressed:sender];
    //    }
}

- (void)bt2Action:(id)sender
{
    if (self.bt2Block != nil) {
        self.bt2Block(sender);
    }
    //    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(bt2Pressed:)]) {
    //        [self.delegate bt2Pressed:sender];
    //    }
}

- (void)bt3Action:(id)sender
{
    if (self.bt3Block != nil) {
        self.bt3Block(sender);
    }
    //    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(bt3Pressed:)]) {
    //        [self.delegate bt3Pressed:sender];
}
@end
