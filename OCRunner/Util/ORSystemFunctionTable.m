//
//  ORSystemFunctionTable.m
//  OCRunner
//
//  Created by Jiang on 2020/7/17.
//  Copyright © 2020 SilverFruity. All rights reserved.
//

#import "ORSystemFunctionTable.h"

@implementation ORSystemFunctionTable
{
    NSMutableDictionary <NSString *,NSValue *>*_table;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _table = [NSMutableDictionary dictionary];
    }
    return self;
}
+ (instancetype)shareInstance{
    static id st_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        st_instance = [[ORSystemFunctionTable alloc] init];
    });
    return st_instance;
}
+ (void)reg:(NSString *)name pointer:(void *)pointer{
    [ORSystemFunctionTable shareInstance]->_table[name] = [NSValue valueWithPointer:pointer];
}
+ (void *)pointerForFunctionName:(NSString *)name{
    NSValue *value = [ORSystemFunctionTable shareInstance]->_table[name];
    return value.pointerValue;
}
@end
