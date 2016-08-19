//
//  ViewController.m
//  0301_ClockFace
//
//  Created by Yuen on 16/9/14.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *hourHand;
@property (nonatomic, weak) IBOutlet UIImageView *minuteHand;
@property (nonatomic, weak) IBOutlet UIImageView *secondHand;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //调整锚点位置，(0.5, 0.5)是锚点默认位置，锚点改为(0.5f, 0.9f)后，锚点移向下方，图片移向上方
    self.secondHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.minuteHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.hourHand.layer.anchorPoint = CGPointMake(0.5f, 0.9f);

    //开始定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];
    //设置刚启动时 针的正确位置
    [self tick];
}

- (void)tick
{
    // 取得当前时间的时分秒
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    
    // 计算各针的角度
    CGFloat hourAngle = (components.hour / 12.f) * M_PI * 2.0;
    CGFloat minuteAngle = (components.minute / 60.f) * M_PI * 2.0;
    CGFloat secondAngle = (components.second / 60.f) * M_PI * 2.0;
    
    // 旋转针的方向
    self.hourHand.transform = CGAffineTransformMakeRotation(hourAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minuteAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secondAngle);
}

@end
