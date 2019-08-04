//
//  SRTestViewController.m
//  SRPermenantThread_Example
//
//  Created by zsr on 2019/8/4.
//  Copyright © 2019年 zhangsr. All rights reserved.
//

#import "SRTestViewController.h"
#import <SRPermenantThread/SRPermenantThread.h>

@interface SRTestViewController ()

@property (nonatomic, strong) SRPermenantThread *thread;

@end

@implementation SRTestViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thread = [[SRPermenantThread alloc] init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    [button addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
}

- (void)exit:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
