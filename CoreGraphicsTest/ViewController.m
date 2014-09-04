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
    

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.duration = 1.0;
    animation.autoreverses = YES;
    animation.repeatCount = FLT_MAX;
    animation.toValue = [NSNumber numberWithFloat:300.0];
    [testView.layer addAnimation:animation forKey:@"transform.translation.y"];
    
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.duration = 1.0;
    animation.autoreverses = YES;
    animation.repeatCount = FLT_MAX;
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue   = [NSNumber numberWithFloat:0.5];
    [testView.layer addAnimation:animation forKey:@"transform.scale.x"];
    
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
