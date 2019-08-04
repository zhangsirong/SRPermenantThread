//
//  SRPermenantThread.m
//  SRPermenantThread
//
//  Created by zsr on 2019/8/4.
//

#import "SRPermenantThread.h"

@interface SRPermenantThread()
@property (strong, nonatomic) NSThread *innerThread;
@end

@implementation SRPermenantThread

- (void)dealloc {
    [self stop];
}

#pragma mark - public methods

- (instancetype)init {
    if (self = [super init]) {
        self.innerThread = [[NSThread alloc] initWithBlock:^{
            // 创建上下文（要初始化一下结构体）
            CFRunLoopSourceContext context = {0};
            
            // 创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            
            // 往Runloop中添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            // 销毁source
            CFRelease(source);
            
            // 启动
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        }];
        
        [self.innerThread start];
    }
    return self;
}

- (void)executeTask:(dispatch_block_t)task {
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

- (void)stop {
    if (!self.innerThread) {
        return;
    }
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}


#pragma mark - private methods

- (void)__stop {
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(dispatch_block_t)task {
    task();
}

@end
