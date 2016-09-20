//
//  XGScrollView.m
//  Objective-C_iOSCoreAnimation
//
//  Created by Yuen on 16/9/21.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "XGScrollView.h"

@implementation XGScrollView


/**
 不同于UIScrollView，定制的滑动视图类并没有实现任何形式的边界检查（bounds checking）。图层内容极有可能滑出视图的边界并无限滑下去。CAScrollLayer并没有等同于UIScrollView中contentSize的属性，所以当CAScrollLayer滑动的时候完全没有一个全局的可滑动区域的概念，也无法自适应它的边界原点至你指定的值。它之所以不能自适应边界大小是因为它不需要，内容完全可以超过边界。
 那你一定会奇怪用CAScrollLayer的意义到底何在，因为你可以简单地用一个普通的CALayer然后手动适应边界原点啊。真相其实并不复杂，UIScrollView并没有用CAScrollLayer，事实上，就是简单的通过直接操作图层边界来实现滑动。
 */
+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    //enable clipping
    self.layer.masksToBounds = YES;
    
    //attach pan gesture recognizer
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc]
                  initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (id)initWithFrame:(CGRect)frame {
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame]))
    {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //this is called when view is created from a nib
    [self setUp];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    //scroll the layer
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self];
}

@end
