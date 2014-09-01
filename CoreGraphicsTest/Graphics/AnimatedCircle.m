//
//  AnimatedCircle.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/9/1.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "AnimatedCircle.h"

//Gold
#define CORLOR_CIRCLE  [UIColor colorWithRed:255.0/255.0 green:215.0/255.0 blue:0 alpha:1];

@implementation AnimatedCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        //add TapGesture
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:gesture];
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    CGFloat width = 4;
    //gold
    UIColor* color = CORLOR_CIRCLE;
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //color        use this or  CGContextSetRGBStrokeColor(context, r, g, b, a);
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    //width
    CGContextSetLineWidth(context, width);
    
    
    CGPoint center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    CGFloat radius = (rect.size.width - width) / 2;
    
    CGContextAddArc(context, center.x, center.y, radius, 0, 2 * M_PI, 0);
    CGContextStrokePath(context);
    
}




#pragma mark - 


-(void)handleTap:(id)sender
{
    [self scaleAnimation];
}

-(void)scaleAnimation
{
    UIColor *stroke = CORLOR_CIRCLE;
    
    CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:CGRectGetWidth(self.bounds) / 2];
    
    // accounts for left/right offset and contentOffset of scroll view
    CGPoint shapePosition = [self convertPoint:self.center fromView:nil];
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path.CGPath;
    circleShape.position = shapePosition;
    circleShape.fillColor = [UIColor clearColor].CGColor;
    circleShape.opacity = 0;
    circleShape.strokeColor = stroke.CGColor;
    circleShape.lineWidth = 3;
    
    [self.layer addSublayer:circleShape];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2.5, 2.5, 1)];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[scaleAnimation, alphaAnimation];
    animation.duration = 0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [circleShape addAnimation:animation forKey:nil];
    
}


@end
