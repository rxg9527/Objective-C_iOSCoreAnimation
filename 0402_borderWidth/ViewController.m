//
//  ViewController.m
//  0401_圆角+masksToBounds
//
//  Created by Yuen on 16/8/22.
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
    self.layerView1.layer.cornerRadius = 20.f;
    self.layerView2.layer.cornerRadius = 20.f;
    
    //默认borderColor是黑色
    self.layerView1.layer.borderWidth = 5.f;
    self.layerView2.layer.borderWidth = 5.f;
    
    self.layerView1.layer.masksToBounds = YES;
}

@end
