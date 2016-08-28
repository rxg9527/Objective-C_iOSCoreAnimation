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
    /**
     *  “通常500-1000就已经很好了，但对于特定的图层有时候更小后者更大的值会看起来更舒服，减少距离的值会增强透视效果，所以一个非常微小的值会让它看起来更加失真，然而一个非常大的值会让它基本失去透视效果”
     */
    transform3D.m34 = -1.0/500;
    transform3D = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);

    self.layerView.layer.transform = transform3D;
}

@end
