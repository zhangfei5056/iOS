//
//  CMView.h
//  study
//
//  Created by caoyuan on 8/13/15.
//  Copyright (c) 2015 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYTransparencyView : UIView
@property (nonatomic) BOOL dragEnable;
@property (assign, nonatomic)UIButton *underneathButton;

- (void)setDragUnable;
@end
