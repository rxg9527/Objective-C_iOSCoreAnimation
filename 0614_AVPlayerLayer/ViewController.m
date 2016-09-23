//
//  ViewController.m
//  0614_AVPlayerLayer
//
//  Created by Yuen on 16/9/23.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Ship" withExtension:@"mp4"];
    
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    layer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:layer];
    
    [player play];
}

@end
