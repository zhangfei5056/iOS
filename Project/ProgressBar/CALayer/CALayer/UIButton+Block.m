//
//  UIButton+Block.m
//  CALayer
//
//  Created by caoyuan on 7/29/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>
@implementation UIButton (Block)
static char overviewKey;

@dynamic event;

- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}


- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}

@end
