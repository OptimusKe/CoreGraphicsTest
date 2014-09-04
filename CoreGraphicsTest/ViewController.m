//
//  ViewController.m
//  CoreGraphicsTest
//
//  Created by Jack on 2014/8/28.
//  Copyright (c) 2014年 Jack. All rights reserved.
//

#import "ViewController.h"

#import "Arrow.h"
#import "Triangle.h"
#import "Stick.h"
#import "Coin.h"
#import "Heart.h"
#import "Circle.h"
#import "AnimatedCircle.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //MARK::column 1
    Arrow* arrow = [Arrow new];
    arrow.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:arrow];
    
    Triangle* triangle = [Triangle new];
    triangle.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:triangle];
    
    Stick* stick = [Stick new];
    stick.frame = CGRectMake(0, 200, 100, 100);
    [self.view addSubview:stick];
    
    Coin* coin = [Coin new];
    coin.frame = CGRectMake(0, 300, 100, 100);
    [self.view addSubview:coin];
    
    Heart* heart = [Heart new];
    heart.frame = CGRectMake(0, 400, 100, 100);
    [self.view addSubview:heart];
    
    
    //MARK::column 2
    Circle* circle = [Circle new];
    circle.frame = CGRectMake(100, 0, 100, 100);
    [self.view addSubview:circle];
    
    AnimatedCircle* animatedCircle = [AnimatedCircle new];
    animatedCircle.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:animatedCircle];
    
    //auto repeat
//    [NSTimer scheduledTimerWithTimeInterval:1 target:animatedCircle selector:@selector(scaleAnimation) userInfo:nil repeats:YES];
    
    
    
    UIView* testView = [UIView new];
    testView.frame = CGRectMake(200, 100, 100, 100);
    [testView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:testView];
    

    //移動
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    translation.fromValue=[NSNumber numberWithDouble:0.0];
    translation.toValue = [NSNumber numberWithFloat:400.0];
    
    
    //縮放
    CATransform3D scale = CATransform3DIdentity;
    scale = CATransform3DMakeScale( 1.5, 1.5, 1.0);
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation
                                         animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:(scale)];

    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.repeatCount = FLT_MAX;
    group.autoreverses = YES;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //注意::先translation在scaleAnimation會只剩scale的動畫而已
    group.animations = [NSArray arrayWithObjects: scaleAnimation,translation, nil];
    [testView.layer addAnimation:group forKey:nil];
    
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [testView addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleTap:(id)sender
{
    NSLog(@"handleTap");
}

@end
