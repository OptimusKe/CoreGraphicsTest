//
//  Arrow.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/8/28.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "Arrow.h"

@implementation Arrow

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
    
    //參考http://furnacedigital.blogspot.tw/2010/12/quartz-2d.html
    
    //建立一個Graphic context並把狀態儲存起來
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    UIColor* color = [UIColor yellowColor];

    //畫箭頭
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect) / 2, CGRectGetMaxY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect) / 2, CGRectGetMaxY(rect) / 2);
    [color setFill];
//    CGContextSetRGBFillColor(context, 1, 1, 0, 1);  //用這個填顏色也行
    CGContextFillPath(context);
    //save
    CGContextSaveGState(context);
    
    
    
    
    //補畫長方體
    CGRect rectangle = CGRectMake(CGRectGetMaxX(rect) / 4,
                                  CGRectGetMinY(rect),
                                  CGRectGetMaxX(rect) / 2,
                                  CGRectGetMaxY(rect) / 2);
    CGContextAddRect(context, rectangle);
    [color setFill];
    CGContextFillPath(context);
    //save
    CGContextSaveGState(context);
        

}

@end
