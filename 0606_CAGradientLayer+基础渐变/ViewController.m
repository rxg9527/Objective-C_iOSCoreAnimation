//
//  ViewController.m
//  0606_CAGradientLayer+基础渐变
//
//  Created by Yuen on 16/8/30.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.view.layer.bounds;
    [self.view.layer addSublayer:layer];
    
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
}

@end
