//
//  ViewController.m
//  0501_视图旋转45度+仿射变换(CAAffineTransformMakeRotation)
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
    
    self.layerView.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
}

@end
