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
    
    /**
     *  “-hitTest:方法同样接受一个CGPoint类型的参数，它返回图层本身，或者包含这个坐标点的子节点图层。”
     *  返回的是最sub的那个图层
     */
    CALayer *layer = [self.view.layer hitTest:point];
    
    if ([layer isEqual:self.blueLayer]) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if ([layer isEqual:self.layerView.layer]) {
        [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

@end
