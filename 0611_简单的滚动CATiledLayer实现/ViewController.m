//
//  ViewController.m
//  0611_简单的滚动CATiledLayer实现
//
//  Created by Yuen on 16/9/21.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CALayerDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController


/**
 CATiledLayer API的一个略显古怪的特性。图块通常在后台的线程中加载，然后以设定的持续时间（默认为0.25秒）淡入到位。奇怪的是，fadeDuration不是属性，而是定义为类方法，所以无法从分块图层进行修改。为了解决这个问题，我们需要创建一个CATiledLayer的子类，PRPTiledLayer，来重载fadeDuration方法，以返回我们想要的值（在这里是0）。这使得新的图块立即得以显示，而总体上对滚动性能没有什么影响。
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //add the tiled layer
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    [self.scrollView.layer addSublayer:tileLayer];
    
    //configure the scroll view
    self.scrollView.contentSize = tileLayer.frame.size;
    
    //draw layer
    [tileLayer setNeedsDisplay];
}

/**
 CATiledLayer（不同于大部分的UIKit和Core Animation方法）支持多线程绘制，-drawLayer:inContext:方法可以在多个线程中同时地并发调用，所以请小心谨慎地确保你在这个方法中实现的绘制代码是线程安全的。
 */
- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    
    //load tile image
    NSString *imageName = [NSString stringWithFormat:@"Snowman_%02li_%02li", (long)x, (long)y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    
    //draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

@end
