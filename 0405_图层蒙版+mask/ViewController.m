//
//  ViewController.m
//  0405_图层蒙版+mask
//
//  Created by Yuen on 16/8/23.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建蒙版图层
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Cone"].CGImage);
    
    //apply mask to image layer
    self.imageView.layer.mask = maskLayer;
    
    /**
     *
     mask图层的frame属性是无关紧要的，真正重要的是图层的轮廓。mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。
     如果mask图层比父图层要小，只有在mask图层里面的内容才是它关心的，除此以外的一切都会被隐藏起来。
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
