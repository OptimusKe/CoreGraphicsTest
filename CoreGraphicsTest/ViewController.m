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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
