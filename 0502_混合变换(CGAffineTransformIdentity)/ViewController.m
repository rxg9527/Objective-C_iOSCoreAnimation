//
//  ViewController.m
//  0502_混合变换(CGAffineTransformIdentity)
//
//  Created by Yuen on 16/8/27.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CGAffineTransform transform = CGAffineTransformIdentity;
    
    //scale by 50%
    transform = CGAffineTransformScale(transform, 0.5, 0.5);
    
    //rotate by 30 degrees
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    
    //translate by 200 points
    transform = CGAffineTransformTranslate(transform, 200, 0);

    self.layerView.layer.affineTransform = transform;
}


@end
