//
//  ViewController.m
//  0503_绕Y轴旋转45°+3D变换
//
//  Created by Yuen on 16/8/27.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layerView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
}

@end
