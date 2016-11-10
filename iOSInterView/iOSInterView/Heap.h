//
//  Heap.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/9.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySortTree.h"

@interface Heap : NSObject
/*
 * desc: 建立并返回小顶堆
 *
 * params: heap 堆， len 长度
 *
 */
+ (NSMutableArray *)createMinHeap:(NSMutableArray *)heap length:(int)len;

/*
 * desc: top k
 *
 * option: 
 * 1. 通过hash table记录输入的值，key为值，value为出现的次数
 * 2. 建立容量为k的小顶堆
 * 3. 按照hash table中的值入堆，返回结果
 *
 * params: heap 堆， len 长度
 */
+ (NSMutableArray *)findTopKMaxNum:(NSMutableArray *)heap length:(int)len;

@end
