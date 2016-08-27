//
//  ViewController.m
//  0504_透视投影+投影变换
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
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = -1.0/500;
    transform3D = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);

    self.layerView.layer.transform = transform3D;
}

@end
