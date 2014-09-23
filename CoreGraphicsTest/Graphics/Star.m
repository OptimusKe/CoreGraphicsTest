//
//  Star.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/9/5.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Star.h"

//Gold
#define CORLOR_CIRCLE  [UIColor colorWithRed:255.0/255.0 green:215.0/255.0 blue:0 alpha:1];

@implementation Star

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
    
    int aSize = CGRectGetWidth(rect);
    const CGFloat color[4] = { 255.0/255.0, 215.0/255.0, 0.0, 1.0 }; // Gold
    CGColorRef aColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), color);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, aSize);
    CGFloat xCenter = CGRectGetMidX(rect);
    CGFloat yCenter = CGRectGetMidY(rect);
    
    
    float  w = CGRectGetWidth(rect); //星形寬
    double r = w / 2.0;
    float flip = -1.0;
    

    CGContextSetFillColorWithColor(context, aColor);
    CGContextSetStrokeColorWithColor(context, aColor);
    
    double theta = 2.0 * M_PI * (2.0 / 5.0); // 144 degrees
    
    CGContextMoveToPoint(context, xCenter, r*flip+yCenter);
    
    for (NSUInteger k=1; k<5; k++)
    {
        float x = r * sin(k * theta);
        float y = r * cos(k * theta);
        CGContextAddLineToPoint(context, x+xCenter, y*flip+yCenter);
    }

    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGFloat fontSize = CGRectGetWidth(rect) / 3;
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize] ,
                                 NSForegroundColorAttributeName:[UIColor blackColor],
                                 NSParagraphStyleAttributeName:style};
    
    
    NSAttributedString* attrStr = [[NSAttributedString alloc] initWithString:@"5" attributes:attributes];
    
    
    [attrStr drawInRect:CGRectMake(CGRectGetMidX(rect) - fontSize / 2,
                                   CGRectGetMidY(rect) - fontSize / 2,
                                   fontSize,
                                   fontSize)];
    
    CGColorRelease(aColor);
}

@end
