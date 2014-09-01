//
//  Circle.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/9/1.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Circle.h"

@implementation Circle

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
    CGFloat width = 4;
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();

    //color        use this or  CGContextSetRGBStrokeColor(context, r, g, b, a);
    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
    //width
    CGContextSetLineWidth(context, width);
    

    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = (rect.size.width - width) / 2;
    
    CGContextAddArc(context, center.x, center.y, radius, 0, 2 * M_PI, 0);
    CGContextStrokePath(context);
}


@end
