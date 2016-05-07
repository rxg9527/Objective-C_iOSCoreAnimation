//
//  ContentsCenterViewController.m
//  Objective-C_iOSCoreAnimation
//
//  Created by Yuen on 16/5/6.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ContentsCenterViewController.h"

@interface ContentsCenterViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation ContentsCenterViewController

- (void)viewDidLoad {
    self.title = @"ContentsCenter";
    
    UIImage *image = [UIImage imageNamed:@"Button"];
    
    [self addStretchableImage:image withContentCenter:CGRectMake(0.1, 0.1, 0.5, 0.5) toLayer:self.button1.layer];
    
    [self addStretchableImage:image withContentCenter:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}

- (void)addStretchableImage:(UIImage *)image
          withContentCenter:(CGRect)rect
                    toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = rect;
}

@end
