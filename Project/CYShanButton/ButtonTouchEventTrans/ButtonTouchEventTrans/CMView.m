//
//  CMView.m
//  ButtonTouchEventTrans
//
//  Created by caoyuan on 8/10/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "CMView.h"

@implementation CMView



#pragma mark - touches
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"B - touchesBeagan..");
//    
//    // 把事件传递下去给父View或包含他的ViewController
//    [self.nextResponder touchesBegan:touches withEvent:event];
//}
//
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"B - touchesCancelled..");
//    // 把事件传递下去给父View或包含他的ViewController
//    [self.nextResponder touchesBegan:touches withEvent:event];
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"B - touchesEnded..");
//    // 把事件传递下去给父View或包含他的ViewController
//    [self.nextResponder touchesBegan:touches withEvent:event];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"B - touchesMoved..");
//    // 把事件传递下去给父View或包含他的ViewController
//    [self.nextResponder touchesBegan:touches withEvent:event];
//    
//}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = CGRectMake(0, 0, 104, 30);
    BOOL a = CGRectContainsPoint(rect, point);
    NSLog(@"%d",a);
    return a;
}


@end
