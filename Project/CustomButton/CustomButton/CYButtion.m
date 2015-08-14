//
//  CYButtion.m
//  CustomButton
//
//  Created by caoyuan on 7/30/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "CYButtion.h"

@implementation CYButtion

- (id)init
{

    if (self = [super init]) {
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{

    //// Bezier Drawing
    UIBezierPath* bezierPath = [self makeShapeWith];
    [UIColor.redColor setFill];
    [bezierPath fill];
    [UIColor.redColor setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    //首先调用父类的方法确定点击的区域确实在按钮的区域中
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        UIBezierPath* bezierPath = [self makeShapeWith];
        if ([bezierPath containsPoint:point]) {
            //如果在path区域内，返回YES
            return YES;
        }
        return NO;
    }
    return NO;
}

- (UIBezierPath*)makeShapeWith
{

    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint:CGPointMake(100.5, 44.5)];
    [bezierPath addCurveToPoint:CGPointMake(76.5, 27.5) controlPoint1:CGPointMake(98.5, 38.5) controlPoint2:CGPointMake(76.5, 27.5)];
    [bezierPath addLineToPoint:CGPointMake(61.5, 37.5)];
    [bezierPath addCurveToPoint:CGPointMake(48.5, 58.5) controlPoint1:CGPointMake(61.5, 37.5) controlPoint2:CGPointMake(48.5, 57.5)];
    [bezierPath addCurveToPoint:CGPointMake(76.5, 94.5) controlPoint1:CGPointMake(48.5, 59.5) controlPoint2:CGPointMake(52.5, 86.5)];
    [bezierPath addCurveToPoint:CGPointMake(106.5, 103.5) controlPoint1:CGPointMake(100.5, 102.5) controlPoint2:CGPointMake(106.5, 103.5)];
    [bezierPath addLineToPoint:CGPointMake(140.5, 94.5)];
    [bezierPath addLineToPoint:CGPointMake(166.5, 65.5)];
    [bezierPath addLineToPoint:CGPointMake(155.5, 37.5)];
    [bezierPath addLineToPoint:CGPointMake(135.5, 27.5)];
    [bezierPath addCurveToPoint:CGPointMake(100.5, 44.5) controlPoint1:CGPointMake(135.5, 27.5) controlPoint2:CGPointMake(102.5, 50.5)];
    [bezierPath closePath];

    return bezierPath;
}

@end
