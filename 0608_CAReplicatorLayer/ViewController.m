//
//  ViewController.m
//  0608_CAReplicatorLayer
//
//  Created by Yuen on 16/9/20.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:replicatorLayer];
    
    replicatorLayer.instanceCount = 10;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI*0.2, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicatorLayer.transform = transform;
    
    replicatorLayer.instanceBlueOffset = -0.1;
    replicatorLayer.instanceRedOffset = -0.1;
    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(100, 100, 100, 100);
    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:subLayer];
}

@end
