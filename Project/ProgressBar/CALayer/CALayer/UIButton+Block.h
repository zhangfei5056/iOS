//
//  UIButton+Block.h
//  CALayer
//
//  Created by caoyuan on 7/29/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton(Block)

@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;
@end
