//
//  BlockView.m
//  testBlockView
//
//  Created by caoyuan on 9/9/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initFromNib{
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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btAction:(id)sender {
    self.MyBlock();
}
@end
