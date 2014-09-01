//
//  Heart.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/8/29.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Heart.h"

@implementation Heart

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
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat radiusTop = CGRectGetWidth(rect) / 4;
    
    //左上半圓
    CGContextAddArc(ctx, CGRectGetWidth(rect) / 4, CGRectGetHeight(rect) / 2, radiusTop, M_PI, 0, 0);
    
    //右上半圓
    CGContextAddArc(ctx, CGRectGetWidth(rect) / 4 * 3, CGRectGetHeight(rect) / 2, radiusTop, M_PI, 0, 0);

    //save
    CGContextSaveGState(ctx);
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) / 2)];
    
    //右下貝茲線
    [path addCurveToPoint:CGPointMake(CGRectGetWidth(rect) / 2, CGRectGetHeight(rect))
            controlPoint1:CGPointMake(CGRectGetWidth(rect)    , CGRectGetHeight(rect) / 50 * 48)
            controlPoint2:CGPointMake(CGRectGetWidth(rect) / 2, CGRectGetHeight(rect) / 50 * 44)];
    
    //左下貝茲線
    [path addCurveToPoint:CGPointMake(CGRectGetMinX(rect)     , CGRectGetHeight(rect) / 2)
            controlPoint1:CGPointMake(CGRectGetWidth(rect) / 2, CGRectGetHeight(rect) / 50 * 44)
            controlPoint2:CGPointMake(CGRectGetMinX(rect)     , CGRectGetHeight(rect) / 50 * 48)];
    
    [[UIColor redColor] setStroke];
    [[UIColor redColor] setFill];
    
    [path fill];
    [path stroke];

    
    
    CGContextFillPath(ctx);
    
}


@end
