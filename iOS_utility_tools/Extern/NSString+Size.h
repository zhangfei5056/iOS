//
//  NSString+Size.h
//  SQTravel
//
//  Created by mini on 14-2-26.
//  Copyright (c) 2014年 mini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
