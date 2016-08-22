//
//  ViewController.m
//  0304_触摸+-containPoint:
//
//  Created by Yuen on 16/8/19.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *layerView;
@property (nonatomic, strong) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //create sublayer
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.f, 50.f, 100.f, 100.f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取触摸点在view上的位置
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //将触摸点的坐标从self.view.layer上转换到self.layerView上
    point = [self.layerView.layer convertPoint:point
                                     fromLayer:self.view.layer];
    //逐级判断触摸是否在self.blueLayer的范围上
    if ([self.layerView.layer containsPoint:point]) {
        
        point = [self.blueLayer convertPoint:point
                                   fromLayer:self.layerView.layer];
        
        if ([self.blueLayer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }
}

@end
