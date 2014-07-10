//
//  BubbleView.m
//  WifiShare_iPhone
//
//  Created by lin.gao on 12-11-5.
//  Copyright (c) 2012年 banma. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView

- (id)initBubbleWith:(NSString *)text date:(NSString *)time from:(BOOL)fromSelf {
    if (self = [super init]) {
        self.frame = CGRectZero;
        self.backgroundColor = [UIColor clearColor];
        
        UIImage *bubble = [UIImage imageNamed:fromSelf?@"chat_bubble_send":@"chat_bubble_recv" ];
        UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:21 topCapHeight:14]];
        
        UIFont *font = [UIFont systemFontOfSize:18];
        CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(200.0f, 1000.0f) lineBreakMode:UILineBreakModeCharacterWrap];
     
        UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(21.0f,
                                                                        3.0f,
                                                                        size.width,
                                                                        size.height)];
        UILabel *timeText = [[UILabel alloc] initWithFrame:CGRectMake(21.0f,
                                                                      1.0f+size.height,
                                                                      100,
                                                                      20)];
        float width_self = (size.width > 100) ? size.width:100;
        bubbleText.backgroundColor = [UIColor clearColor];
        timeText.backgroundColor = [UIColor clearColor];
        bubbleText.font = font;
        timeText.font = [UIFont systemFontOfSize:15];
        [timeText setTextColor:[UIColor lightGrayColor]];
        [bubbleText setTextColor:[UIColor blackColor]];
        bubbleText.numberOfLines = 0;
        bubbleText.lineBreakMode = UILineBreakModeCharacterWrap;
        bubbleText.text = text;
        timeText.text = time;
        
        bubbleImageView.frame = CGRectMake(0.0f, 0.0f, width_self+30, size.height+25.0f);
        if(fromSelf){
            self.frame = CGRectMake(290.f-width_self, 10.0f, width_self, size.height+55.0f);
        }
        else{
            self.frame = CGRectMake(0.0f, 10.0f, width_self+30, size.height+55.0f);
        }
        
        [self addSubview:bubbleImageView];
        [bubbleImageView release];
        [self addSubview:bubbleText];
        [bubbleText release];
        [self addSubview:timeText];
        [timeText release];

    }
    
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
