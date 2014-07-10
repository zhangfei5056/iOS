//
//  UIView+Nib.h
//  Installation
//
//  Created by gaolin on 12-9-21.
//  Copyright (c) 2012年 Banma.com. All rights reserved.
//



@interface UIView (Nib)

- (id)initFromNib;
@end


@interface UITableViewCell (Nib)
- (id)initFromNibWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier;
@end