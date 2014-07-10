//
//  ListRowCell.h
//  AddressList
//
//  Created by mini on 13-3-15.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDImageView;
@interface ListRowCell : UITableViewCell

@property (nonatomic,retain)IBOutlet UILabel *titleLabel;
@property (nonatomic,retain)IBOutlet UILabel *phoneLabel;
@property (nonatomic,retain)IBOutlet UIButton *checkBoxBt;
@property (nonatomic,retain)IBOutlet SDImageView *iconImgView;

-(void)updateUserIcon:(NSString *)imgUrl;
- (id)initFromNibWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier;

@end
