//
//  XGLayerLabel.m
//  Objective-C_iOSCoreAnimation
//
//  Created by Yuen on 16/8/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "XGLayerLabel.h"

@implementation XGLayerLabel


#pragma mark - LifeCyle
- (instancetype)initWithFrame:(CGRect)frame {
    //called when creating label programmatically
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //called when creating label using Interface Builder
    [self setUp];
}

#pragma mark - Setup
- (void)setUp {
    //set defaults from UILabel settings
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    
    //we should really derive these from the UILabel settings too
    //but that's complicated, so for now we'll just hard-code them
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    
    [self.layer display];
}

#pragma mark - Other

/**
 如果我们继承了UIView，那我们就可以重写+layerClass方法使得在创建的时候能返回一个不同的图层子类。UIView会在初始化的时候调用+layerClass方法，然后用它的返回类型来创建宿主图层。
 */
+ (Class)layerClass {
    //this makes our label create a CATextLayer
    //instead of a regular CALayer for its backing layer
    return [CATextLayer class];
}

- (CATextLayer *)textLayer {
    /**
     把CATextLayer作为宿主图层的另一好处就是视图自动设置了contentsScale属性
     */
    return (CATextLayer *)self.layer;
}

#pragma mark - Setter
- (void)setText:(NSString *)text {
    super.text = text;
    
    //set layer text
    [self textLayer].string = text;
}

- (void)setTextColor:(UIColor *)textColor {
    super.textColor = textColor;
    
    //set layer text color
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    super.font = font;
    
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}

@end
