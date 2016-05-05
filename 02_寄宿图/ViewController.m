//
//  ViewController.m
//  02_寄宿图
//
//  Created by Yuen on 16/5/5.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *snowManImage = [UIImage imageNamed:@"Snowman"];
    self.view.layer.contents = (__bridge id _Nullable)(snowManImage.CGImage);
//    self.view.layer.contentsGravity = kCAGravityResizeAspect;
    
    [self setLayerContentClarity];
}

/**
 *  “当用代码的方式来处理寄宿图的时候，一定要记住要手动的设置图层的contentsScale属性”
 */
- (void)setLayerContentClarity {
    self.view.layer.contentsGravity = kCAGravityCenter;
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
}

@end
