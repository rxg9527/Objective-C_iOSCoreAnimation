//
//  ViewController.m
//  0406_LCDClock+拉伸过滤magnificationFilter
//
//  Created by Yuen on 16/8/26.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray *digitViews;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *digitImage = [UIImage imageNamed:@"Digits"];
    
    for (UIView *timeView in self.digitViews) {
        timeView.layer.contents = (__bridge id _Nullable)(digitImage.CGImage);
        timeView.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        timeView.layer.contentsGravity = kCAGravityResizeAspect;
        
//        timeView.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];
    [self tick];
}

- (void)tick {
    //转换时间为『时、分、秒』
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unit fromDate:[NSDate date]];
    
    //设置时、分、秒
    [self setDigit:components.hour/10 forView:self.digitViews[0]];
    [self setDigit:components.hour%10 forView:self.digitViews[1]];
    
    [self setDigit:components.minute/10 forView:self.digitViews[2]];
    [self setDigit:components.minute%10 forView:self.digitViews[3]];
    
    [self setDigit:components.second/10 forView:self.digitViews[4]];
    [self setDigit:components.second%10 forView:self.digitViews[5]];
}

- (void)setDigit:(NSUInteger)digit forView:(UIView *)view {
    //调整contentRect到正确的数字
    view.layer.contentsRect = CGRectMake(digit*0.1, 0, 0.1, 1.0);
}

@end
