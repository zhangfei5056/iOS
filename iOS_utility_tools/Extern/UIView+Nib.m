//
//  UIView+Nib.m
//  Installation
//
//  Created by gaolin on 12-9-21.
//  Copyright (c) 2012年 Banma.com. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)
- (id)initFromNib{
    self = [self init];
    if (self) {
        NSString *nibName = NSStringFromClass([self class]);
        NSArray *objs = [[NSBundle mainBundle] loadNibNamed:nibName
                                                      owner:self
                                                    options:nil];
        UIView *view = [objs lastObject];
        self.frame = view.frame;
        [self addSubview:view];
    }
    return self;
}


@end

@implementation UITableViewCell (Nib)
- (id)initFromNibWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier{
    self = [self initWithStyle:style reuseIdentifier:identifier];
    if (self) {
        NSString *nibName = NSStringFromClass([self class]);
        NSArray *objs = [[NSBundle mainBundle] loadNibNamed:nibName
                                                      owner:self
                                                    options:nil];
        UIView *view = [objs lastObject];
        self.frame = view.frame;
        [self addSubview:view];
    }
    return self;
}
@end