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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
