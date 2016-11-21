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

// move zero
- (void)backZero {
    NSMutableArray *array = (NSMutableArray *)self;
    if (!([array count] > 0 && [array isKindOfClass:[NSMutableArray class]])) {
        return;
    }
    
    int count = 0;
    // 将大于0的放在数组前面
    for (int i = 0; i < [array count]; i++) {
        if ([array[i] intValue] != 0) {
            array[count++] = array[i];
        }
    }
    // 数组后面填0
    for (int i = count; i < [array count]; i++) {
        array[i] = @0;
    }
}

// 从一个数组中找到一对元素，其和是一个给数字，返回这些数字的下标
+ (id)twoSum:(NSArray *)array value:(NSInteger)val {
    if ([array count] < 2) {
        return nil;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < [array count]; i++) {
        NSString *currentNum = [NSString stringWithFormat:@"%ld", val - [[array objectAtIndex:i] intValue]];
        dict[currentNum] = [NSNumber numberWithInteger:i];
    }
    
    for (NSInteger i = 0; i < [array count]; i++) {
        NSString *currentNum = [NSString stringWithFormat:@"%d", [[array objectAtIndex:i] intValue]];
        if (dict[currentNum]) {
            return @[[NSNumber numberWithInteger:i], dict[currentNum]];
        }
    }
    
    return nil;
}

// 三个数相加和为一个指定数字
- (NSMutableArray *)threeNumPlusToNum:(int)num {
    NSMutableArray *array = (NSMutableArray *)self;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if (!([array count] > 0 && [array isKindOfClass:[NSMutableArray class]])) {
        return nil;
    }
    
    for (int i = 0; i < [array count] - 2; i++) {
        if (i > 0 && [array[i] intValue] == [array[i - 1] intValue]) {
            continue;
        }
        
        int target = num - [array[i] intValue];
        [self twoSumForThreeSum:array start:i + 1 target:target result:result];
    }
    
    return result;
}

- (void)twoSumForThreeSum:(NSMutableArray *)array start:(int)start target:(int)target result:(NSMutableArray *)result {
    int head = start;
    int tail = (int)[array count] - 1;
    
    while (head < tail) {
        int temp = [array[head] intValue] + [array[tail] intValue];
        if (temp < target) {
            head++;
        }
        else if (temp > target) {
            tail--;
        }
        else {
            NSMutableArray *dict = [[NSMutableArray alloc] init];
            [dict push:array[start - 1]];
            [dict push:array[head]];
            [dict push:array[tail]];
            [result push:dict];
            
            //为了防止出现重复的二元组，使结果等于target
            int k = head+1;
            while(k < tail && array[k] == array[head]) k++;
            head = k;
            k = tail-1;
            while(k > head && array[k] == array[tail]) k--;
            tail = k;
        }
    }
}

@end
