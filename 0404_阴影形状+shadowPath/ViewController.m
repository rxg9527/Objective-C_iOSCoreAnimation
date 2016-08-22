//
//  ViewController.m
//  0404_阴影形状+shadowPath
//
//  Created by Yuen on 16/8/23.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView1;
@property (nonatomic, weak) IBOutlet UIView *layerView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //开启layer的阴影
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView2.layer.shadowOpacity = 0.5f;

    //创建一个矩形阴影
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    //创建一个圆形阴影
    CGMutablePathRef roundPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(roundPath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = roundPath;
    CGPathRelease(roundPath);
}

@end
