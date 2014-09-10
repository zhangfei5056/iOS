//
//  BlockView.h
//  testBlockView
//
//  Created by caoyuan on 9/9/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyBlock)(void);
@interface BlockView : UIView
- (IBAction)btAction:(id)sender;
@property (copy,nonatomic) void(^MyBlock)(void);
- (instancetype)initFromNib;
@end
