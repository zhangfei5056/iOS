//
//  ListRowCell.m
//  AddressList
//
//  Created by mini on 13-3-15.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "ListRowCell.h"
#import "SDImageView.h"

@implementation ListRowCell
@synthesize titleLabel,phoneLabel,iconImgView,checkBoxBt;
//- (void)dealloc
//{
//    self.titleLabel = nil;
//    [iconImgView release];
//    iconImgView = nil;
//    [phoneLabel release];
//    phoneLabel = nil;
//    [checkBoxBt release];
//    checkBoxBt = nil;
//    
//    [super dealloc];
//}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateUserIcon:(NSString *)imgUrl
{
    self.iconImgView.image = [UIImage imageNamed:@"user_icon"];
    if (![imgUrl isEqualToString:@"未知"]) {
        NSURL *url = [NSURL URLWithString:imgUrl];
        [self.iconImgView setImageWithURL:url];
        if (!self.iconImgView.image) {
            self.iconImgView.image = [UIImage imageNamed:@"user_icon"];
        }
    }
}

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
