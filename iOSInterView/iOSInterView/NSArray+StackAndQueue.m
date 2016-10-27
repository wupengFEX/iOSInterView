//
//  NSObject+StackAndQueue.m
//  iOSInterView
//
//  Created by smart on 2016/10/27.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "NSArray+StackAndQueue.h"

@implementation NSArray (StackAndQueue)

// 入栈操作
- (void)push:(id)val {
    if ([self isKindOfClass:[NSMutableArray class]]) {
        [(NSMutableArray *)self addObject:val];
    }
}

// 出栈操作
- (id)pop {
    id lastObject;
    if ([self isKindOfClass:[NSMutableArray class]]) {
        lastObject = [self lastObject];
        [(NSMutableArray *)self removeLastObject];
    }
    return lastObject;
}

// 栈按照队列进行输出
- (void)reverToHeap {
    NSMutableArray *array = (NSMutableArray *)self;
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return;
    }
    
    NSMutableArray *heapArray = [[NSMutableArray alloc] initWithArray:array];
    [array removeAllObjects];
    while ([heapArray count]) {
        [array push:[heapArray pop]];
    }        
}

// 如何按照升序，使用另外一个栈来排序一个栈，如按照升序来pop
- (NSMutableArray *)sortStackWidthDoubleStack {
    NSMutableArray *input = (NSMutableArray *)self;
    if (!([input isKindOfClass:[NSMutableArray class]] && [input count])) {
        return nil;
    }
    
    NSMutableArray *output = [[NSMutableArray alloc] init];
    [output push:[input pop]];
    
    while ([input count]) {
        id val = [input pop];
        while ([output count] && [[output lastObject] intValue] > [val intValue]) {
            [input push:[output pop]];
        }
        [output push:val];
    }
    return output;
}

// 给定一个二叉树，使用栈实现中序遍历
- (void)inOrderBinaryTreeWithStack:(BinarySortTree *)root {
    if (!(root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    while ([stack count] || root) {
        if (root) {
            [stack push:root];
            root = root.leftNode;
        }
        else {
            root = [stack lastObject];
            [stack pop];
            NSLog(@"%d", (int)root.value);
            root = root.rightNode;
        }
    }
}

// 给定一个字符串，他只包括'('，')','{','}','[',']',判断输入的字符串是否是一个有效的圆括号字符串
+ (BOOL)judgeVaildString:(NSString *)string {
    if (string.length <= 0) {
        return NO;
    }
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < string.length; i++) {
        NSString *charter = [string substringWithRange:NSMakeRange(i, 1)];
        
        if ([self isLeftMatch:charter]) {
            [stack push:charter];
        }
        else {
            if (![self matchCharter:charter charter:[stack lastObject]]) {
                return false;
            }
            [stack pop];
        }
    }
    return [stack count] == 0;
}

+ (BOOL)isLeftMatch:(NSString *)charter {
    if (charter.length != 1) {
        return NO;
    }
    
    if ([charter isEqualToString:@"{"] ||
        [charter isEqualToString:@"["] ||
        [charter isEqualToString:@"("]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)matchCharter:(NSString *)str charter:(NSString *)charter {
    if (charter.length != 1) {
        return nil;
    }
    
    BOOL chr = nil;
    if ([str isEqualToString:@"}"]) {
        chr = [charter isEqualToString:@"{"];
    }
    else if ([str isEqualToString:@"]"]) {
        chr = [charter isEqualToString:@"["];
    }
    else if ([str isEqualToString:@")"]) {
        chr = [charter isEqualToString:@"("];
    }
    return chr;
}

@end
