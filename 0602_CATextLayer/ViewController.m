//
//  ViewController.m
//  0602_CATextLayer
//
//  Created by Yuen on 16/8/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.view.bounds;
    
    textLayer.foregroundColor = [UIColor blueColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.wrapped = YES; //开启自动换行
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    //CATextLayer的font属性不是一个UIFont类型，而是一个CFTypeRef类型。这样可以根据你的具体需要来决定字体属性应该是用CGFontRef类型还是CTFontRef类型（Core Text字体）
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    if (fontRef) {
        CGFontRelease(fontRef);
    }
    
    NSString *text = @"【苹果MD818FE/A】苹果（Apple） MD818FE/A Lightning to USB iPhone/iPad/iPod 连接线/数据线【行情 报价 价格 评测】-京东 http://item.jd.com/771942.html";
    //CATextLayer的string属性并不是你想象的NSString类型，而是id类型。这样你既可以用NSString也可以用NSAttributedString来指定文本了（注意，NSAttributedString并不是NSString的子类）
    textLayer.string = text;
    
    [self.view.layer addSublayer:textLayer];
    
    //决定图层内容应该以怎样的分辨率来渲染
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}

@end
