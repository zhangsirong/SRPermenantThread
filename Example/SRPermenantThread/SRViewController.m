//
//  SRViewController.m
//  SRPermenantThread
//
//  Created by zhangsr on 08/04/2019.
//  Copyright (c) 2019 zhangsr. All rights reserved.
//

#import "SRViewController.h"

@interface SRViewController ()

@end

@implementation SRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[NSClassFromString(@"SRTestViewController") new] animated:YES completion:^{
        
    }];
}


@end
