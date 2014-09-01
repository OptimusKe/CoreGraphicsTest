//
//  Coin.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/8/28.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Coin.h"

@implementation Coin

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //clip box
    CGFloat scale = 1.0 / 3.0;
    CGRect scaleRect = CGRectMake(CGRectGetMidX(rect) - (CGRectGetWidth(rect) * scale) / 2,
                                  CGRectGetMidY(rect) - (CGRectGetHeight(rect) * scale) / 2,
                                  CGRectGetWidth(rect) * scale,
                                  CGRectGetHeight(rect) * scale);
    
    
    //橢圓
    CGContextAddEllipseInRect(context,rect);
    [[UIColor blueColor] setFill];
    CGContextFillPath(context);
    
    //clip box
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, scaleRect);
    CGContextClearRect(ctx,scaleRect);
    
    
    
    //save
    CGContextSaveGState(context);
    
    
    
}


@end
