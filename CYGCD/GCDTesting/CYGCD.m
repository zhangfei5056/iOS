//
//  CYGCD.m
//
//
//  Created by caoyuan on 8/16/15.
//
//

#import "CYGCD.h"
@interface CYGCD ()
{
    dispatch_queue_t urls_queue;
}
@end


@implementation CYGCD


+ (CYGCD *)getCYQueue
{
    static CYGCD *sharedCYGCDInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedCYGCDInstance = [[self alloc ]init];
        
    });
    return sharedCYGCDInstance;
}

- (CYGCD *)init {
    if (self = [super init]) {
        urls_queue = dispatch_queue_create("CY", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}



- (void)doInCYQueue:(Block)block
{
    
    
    dispatch_async(urls_queue, ^{
        // your code
        
        block();
        
    });
}

- (void)doInMainQueue:(Block)block
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        block();
    });
}

- (void)doInGlobalQueue:(Block)block
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        block();
    });

}

@end
