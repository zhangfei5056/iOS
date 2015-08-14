//
//  CMView.m
//  study
//
//  Created by caoyuan on 8/13/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "CYTransparencyView.h"
@interface CYTransparencyView ()
{
    CGPoint beginPoint;
}

@end


@implementation CYTransparencyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dragEnable = YES;
    }
    
    return self;
}

- (void)setDragUnable {
    self.dragEnable = NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint hitPoint = [self.underneathButton convertPoint:point fromView:self];
    if ([self.underneathButton pointInside:hitPoint withEvent:event]) {
        return self.underneathButton;
    }
    
    return [super hitTest:point withEvent:event];
}


#pragma mark - move
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

@end
