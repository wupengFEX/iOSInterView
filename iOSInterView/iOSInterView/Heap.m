//
//  Heap.m
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/9.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "Heap.h"
#import "HeapNode.h"

@implementation Heap

+ (NSMutableArray *)createMinHeap:(NSMutableArray *)heap length:(int)len {
    if (!([heap isKindOfClass:[NSMutableArray class]] && [heap count] > 0)) {
        return nil;
    }
    if (len <= 0) {
        return nil;
    }
    
    NSMutableArray *heapArray = [[NSMutableArray alloc] initWithCapacity:len];
    for (int i = 0; i < len; i++) {
        heapArray[i] = [NSNumber numberWithInteger:i];
    }
    NSMutableArray *arr = [self buildMinHeap:heapArray length:len];
    for (NSInteger i = [heap count] - 1; i >= 0 ; i--) {
        [self replaceNum:arr length:len value:[heap[i] intValue]];
    }
    return heapArray;
}

+ (NSMutableArray *)findTopKMaxNum:(NSMutableArray *)heap length:(int)len {
    if (!([heap isKindOfClass:[NSMutableArray class]] && [heap count] > 0)) {
        return nil;
    }
    if (len <= 0) {
        return nil;
    }
    
    // QUERY统计
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [heap count]; i++) {
        NSNumber *key = [NSNumber numberWithInteger:[heap[i] intValue]];
        dict[key] =  [NSNumber numberWithInteger:[dict[key] intValue] + 1];
    }
    
    // 建立小顶堆
    NSMutableArray *heapArray = [[NSMutableArray alloc] initWithCapacity:len];
    for (int i = 0; i < len; i++) {
        heapArray[i] = [NSNumber numberWithInteger:i];
    }
    NSMutableArray *arr = [self buildMinHeap:heapArray length:len];
    
    // 筛选
    for (id num in dict) {
        for (int i = 0; i < [dict[num] intValue]; i++) {
            [self replaceNum:arr length:len value:[num intValue]];
        }
    }

    return nil;
}

+ (NSMutableArray *)buildMinHeap:(NSMutableArray *)heap length:(int)len {
    if (!([heap isKindOfClass:[NSMutableArray class]] && [heap count] > 0)) {
        return nil;
    }
    if (len <= 0) {
        return nil;
    }
    
    int middle = len / 2 - 1;
    for (int i = middle; i >= 0; i--) {
        [self heapAdjust:heap length:len index:i];
    }
    
    return heap;
}

+ (void)heapAdjust:(NSMutableArray *)heap length:(int)len index:(int)index {
    if (!([heap isKindOfClass:[NSMutableArray class]] && [heap count] > 0)) {
        return;
    }
    if (len <= 0) {
        return;
    }
    
    int left = 2 * (index + 1) - 1;
    int right = 2 * (index + 1);
    int smallest = index;
    
    if (left < len && heap[left] < heap[smallest]) {
        smallest = left;
    }
    if (right < len && heap[right] < heap[smallest]) {
        smallest = right;
    }
    
    if (smallest != index) {
        id temp = heap[index];
        heap[index] = heap[smallest];
        heap[smallest] = temp;
        [self heapAdjust:heap length:len index:smallest];
    }
}

+ (void)replaceNum:(NSMutableArray *)heap length:(int)len value:(int)val {
    if (!([heap isKindOfClass:[NSMutableArray class]] && [heap count] > 0)) {
        return;
    }
    
    if ([heap[0] intValue] < val) {
        heap[0] = heap[len - 1];
        heap[len - 1] = [NSNumber numberWithInteger:val];
        [self heapAdjust:heap length:--len index:0];
    }
}

@end
