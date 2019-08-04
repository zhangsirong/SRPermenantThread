//
//  SRPermenantThread.h
//  SRPermenantThread
//
//  Created by zsr on 2019/8/4.
//

#import <Foundation/Foundation.h>

/**
 该线程执行完任务不会销毁， 手动调用stop后，线程销毁了
 */
@interface SRPermenantThread : NSObject
/**
 在当前子线程执行一个任务
 */
- (void)executeTask:(dispatch_block_t)task;

/**
 结束线程
 */
- (void)stop;

@end
