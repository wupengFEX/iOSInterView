//
//  NSArray+Sort.m
//  iOSInterView
//
//  Created by smart on 2016/10/28.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "NSArraySort.h"

@implementation NSArraySort

// 冒泡排序
+ (NSMutableArray *)bubbleSort:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    NSMutableArray *finalArray = [[NSMutableArray alloc] initWithArray:array];
    for (NSInteger i = 0; i < [finalArray count]; i++) {
        for (NSInteger j = 0; j < [finalArray count] - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                id temp = finalArray[j + 1];
                finalArray[j + 1] = finalArray[j];
                finalArray[j] = temp;
            }
        }
    }
    return finalArray;
}

// 选择排序
+ (NSMutableArray *)selectSort:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    NSMutableArray *finalArray = [[NSMutableArray alloc] initWithArray:array];
    NSInteger maxIndex = 0;
    for (NSInteger i = 0; i < [finalArray count] - 1; i++) {
        maxIndex = i;
        for (NSInteger j = i + 1; j < [finalArray count]; j++) {
            if (finalArray[j] < finalArray[maxIndex]) {
                maxIndex = j;
            }
        }
        id temp = finalArray[i];
        finalArray[i] = finalArray[maxIndex];
        finalArray[maxIndex] = temp;
    }

    return finalArray;
}

// 插入排序
+ (NSMutableArray *)insertSort:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    NSMutableArray *finalArray = [[NSMutableArray alloc] initWithArray:array];
    for (NSInteger i = 1; i < [finalArray count]; i++) {
        NSInteger j = i - 1;
        id guard = finalArray[i];
        while (j >= 0 && finalArray[j] > guard) {
            finalArray[j + 1] = finalArray[j];
            j--;
        }
        finalArray[j + 1] = guard;
    }

    return finalArray;
}

// 归并排序
+ (NSMutableArray *)mergeSort:(NSMutableArray *)array {
    if (!([array isKindOfClass:[NSMutableArray class]] && [array count] > 0)) {
        return nil;
    }
    
    if ([array count] < 2) {
        return array;
    }
    
    NSMutableArray *finalArray = array;
    NSInteger middle = ceilf([array count] / 2.0f);
    NSMutableArray *left = [[NSMutableArray alloc] initWithArray:[finalArray subarrayWithRange:NSMakeRange(0, middle)]];
    NSMutableArray *right = [[NSMutableArray alloc] initWithArray:[finalArray subarrayWithRange:NSMakeRange(middle, [array count] - middle)]];
    
    return [self merge:[self mergeSort:left] rightArray:[self mergeSort:right]];
}

+ (NSMutableArray *)merge:(NSMutableArray *)left rightArray:(NSMutableArray *)right {
    if (!([left isKindOfClass:[NSArray class]] && [right isKindOfClass:[NSArray class]] &&
        [left count] > 0 && [right count] > 0)) {
        return nil;
    }
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    while ([left count] > 0 && [right count] > 0) {
        if (left[0] > right[0]) {
            [result addObject:right[0]];
            [right removeObjectAtIndex:0];
            
        }
        else {
            [result addObject:left[0]];
            [left removeObjectAtIndex:0];
        }
    }
    
    while ([left count]) {
        [result addObject:left[0]];
        [left removeObjectAtIndex:0];
    }
    
    while ([right count]) {
        [result addObject:right[0]];
        [right removeObjectAtIndex:0];
    }
    
    return result;
}

// 快速排序
+ (NSMutableArray *)quickSort:(NSMutableArray *)array {
    if (!([array isKindOfClass:[NSMutableArray class]] && [array count] > 0)) {
        return [[NSMutableArray alloc] init];
    }
    
    if ([array count] < 2) {
        return array;
    }
    
    NSMutableArray *left = [[NSMutableArray alloc] init];
    NSMutableArray *right = [[NSMutableArray alloc] init];
    NSInteger middle = ceilf([array count] / 2.0f);
    id middleVal = array[middle];
    [array removeObjectAtIndex:middle];
    for (NSInteger i = 0; i < [array count]; i++) {
        if (middleVal > array[i]) {
            [left addObject:array[i]];
        }
        else {
            [right addObject:array[i]];
        }
    }
    left = [self quickSort:left];
    right = [self quickSort:right];
    
    NSMutableArray *leftArr = [[NSMutableArray alloc] initWithArray:[left arrayByAddingObject:middleVal]];
    NSMutableArray *rightArr = [[NSMutableArray alloc] initWithArray:[leftArr arrayByAddingObjectsFromArray:right]];
    
    return rightArr;
}

// 桶排序
+ (NSMutableArray *)bucketSort:(NSMutableArray *)array numbersOfBuckets:(NSInteger)num {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    NSInteger max = 0;
    NSInteger min = 0;
    NSInteger space = 0;
    NSInteger n = 0;
    NSMutableDictionary *bucket = [[NSMutableDictionary alloc] init];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [array count]; i++) {
        max = max > [array[i] intValue] ? max : [array[i] intValue];
        min = min < [array[i] intValue] ? min : [array[i] intValue];
    }
    space = (max - min + 1) / num;
    
    for (NSInteger i = 0; i < [array count]; i++) {
        NSNumber *index = [NSNumber numberWithInteger:ceil(([array[i] intValue] - min) / space)];
        if (bucket[index]) {
            NSInteger k = [bucket[index] count] - 1;
            while (k >= 0 && bucket[index][k] > array[i]) {
                bucket[index][k + 1] = bucket[index][k];
                k--;
            }
            bucket[index][k + 1] = array[i];
        }
        else {
            bucket[index] = [[NSMutableArray alloc] init];
            [bucket[index] addObject:array[i]];
        }
    }
    
    while (n < num) {
        result = [[NSMutableArray alloc] initWithArray:[result arrayByAddingObjectsFromArray:bucket[[NSNumber numberWithInteger:n]]]];
        n++;
    }
    
    return result;
}

@end
