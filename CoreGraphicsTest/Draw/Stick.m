//
//  Stick.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/8/28.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Stick.h"

@implementation Stick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGFloat radius = 10;

    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //畫上圓
    CGContextMoveToPoint(ctx, CGRectGetMidX(rect) - radius, CGRectGetMinY(rect)  + radius);

    //CGContextAddArcToPoint比較特別  目前先用CGContextAddArc
    CGContextAddArc(ctx, CGRectGetMidX(rect), radius, radius, M_PI, 0, 0);
    
    //右方直線
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect) + radius, CGRectGetMaxY(rect) - radius);

    //下圓
    CGContextAddArc(ctx, CGRectGetMidX(rect), CGRectGetMaxY(rect) - radius, radius, 0, -M_PI, 0);
    
    
    [[UIColor brownColor] setFill];
    CGContextFillPath(ctx);
    
}


@end
