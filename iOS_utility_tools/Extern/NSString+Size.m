//
//  NSString+Size.m
//  SQTravel
//
//  Created by mini on 14-2-26.
//  Copyright (c) 2014年 mini. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    NSInteger ch;
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size =[self boundingRectWithSize:size
                             options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                          attributes:tdic context:nil].size;
    ch = size.height;
    return ch;
}

@end
