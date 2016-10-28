//
//  NSArray+Sort.h
//  iOSInterView
//
//  Created by smart on 2016/10/28.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArraySort : NSObject

/**
 * desc: 冒泡排序
 *	1. 进行两次便利，第一个for是从 0 - arr.length, 第二次是从0到 arr.length - i - 1;
 * 	2. 每一趟之后最后一个是最大值；
 * 
 * 时间复杂度: 最好情况o(n), 最差o(n^2), 平均o(n^2)
 * 
 * 空间复杂度: 0(1)
 */
+ (NSMutableArray *)bubbleSort:(NSArray *)array;


/**
 * desc: 选择排序
 *	1. 分为两趟，第一趟从0-arr.length-1, 第二趟从i + 1到arr.length
 *	2. 每趟的结果是最小值在最左边
 * 
 * 时间复杂度：最好情况o(n^2), 最差o(n^2), 平均o(n^2)
 * 
 * 空间复杂度：o(1)
 */
+ (NSMutableArray *)selectSort:(NSArray *)array;

/**
 * desc: 插入排序
 *	1. 分为两步，第一步，默认从第1个元素开始便利，第二趟，从该元素开始，从后往前遍历插入
 *	2. 每趟结束之后前面的有序+1
 * 
 * 时间复杂度：最好情况o(n), 最差o(n^2), 平均o(n^2)
 * 
 * 空间复杂度：o(1)
 */
+ (NSMutableArray *)insertSort:(NSArray *)array;

/**
 * desc: 归并排序
 *	1. 取中间值为哨兵，将数组分为两个数组，左数组都小于等于哨兵，右边都大于哨兵
 *	2. 进行递归合并，合并函数为：定义一个数组，比较两数组中的第一个元素，将小的插入到result中，直到一个数组length为0
 *	3. 检查两数组是否长度有不为0的，如果不为0，将其接在result上面
 *
 * 时间复杂度：o(nlongn)
 *
 * 空间复杂度：0(n)
 */
+ (NSMutableArray *)mergeSort:(NSArray *)array;

/**
 * desc: 快速排序
 *	1. 找到中间值，将其分为两个数组，不包括中间的值，左边的小于等于中间值，右边大于中间值；
 *	2. 递归调用快排，返回结果为左边数组连接中间值和右边数组
 *
 * 时间复杂度：最好情况o(nlogn), 最差o(n^2), 平均o(nlogn)
 *
 * 空间复杂度：o(logn)
 */
+ (NSMutableArray *)quickSort:(NSArray *)array;

/**
 * desc: bucket sort
 * 1. 找出数组中的最大值和最小值
 * 2. 确定桶间距 space = (max - min + 1) / num
 * 3. for循环进行分桶
 * 	1. 确定桶的索引值 index = Math.floor((arr[i] - min) / space)
 *	2. 入桶，如果桶对应的索引值存在，则加入其中并进行排序，否则新建该索引下的桶数组
 * 4. 将桶中的每个数组连接起来
 */
+ (NSMutableArray *)bucketSort:(NSMutableArray *)array numbersOfBuckets:(NSInteger)num;

@end
