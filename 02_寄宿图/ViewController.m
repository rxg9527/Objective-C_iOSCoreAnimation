//
//  ViewController.m
//  02_寄宿图
//
//  Created by Yuen on 16/5/5.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *coneView;
@property (nonatomic, weak) IBOutlet UIView *shipView;
@property (nonatomic, weak) IBOutlet UIView *iglooView;
@property (nonatomic, weak) IBOutlet UIView *anchorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIImage *snowManImage = [UIImage imageNamed:@"Snowman"];
//    self.view.layer.contents = (__bridge id _Nullable)(snowManImage.CGImage);
//    self.view.layer.contentsGravity = kCAGravityResizeAspect;
    
//    [self setLayerContentClarity];
    
    [self setLayerSprites];
}

/**
 *  “当用代码的方式来处理寄宿图的时候，一定要记住要手动的设置图层的contentsScale属性”
 */
- (void)setLayerContentClarity {
    self.view.layer.contentsGravity = kCAGravityCenter;
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
}

/**
 *  “contentsRect不是按点来计算的，它使用了单位坐标，单位坐标指定在0到1之间，是一个相对值（像素和点就是绝对值）。所以他们是相对与寄宿图的尺寸的。”
 */
- (void)addSpriteImage:(UIImage *)image
       withContentRect:(CGRect)rect
               toLayer:(CALayer *)layer {
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsRect = rect;
}

- (void)setLayerSprites {
    UIImage *image = [UIImage imageNamed:@"Sprites"];
    
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.coneView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.shipView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.iglooView.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.anchorView.layer];
}
@end
