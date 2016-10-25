//
//  LinkedList.h
//  BinaryTree
//
//  Created by smart on 2016/10/24.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject

/*
 * 前向指针
 */
@property (nonatomic, strong) LinkedList *prev;
/*
 * 后向指针
 */
@property (nonatomic, strong) LinkedList *next;
/*
 * 节点值
 */
@property (nonatomic, assign) NSInteger data;

/**
 * desc: 打印链表的值，打印不带环的链表，调试用
 *
 */
+ (void)printfLinkedList:(LinkedList *)list;

/**
 * desc: 创建首尾不相连的单向链表
 *
 * params: array 构建链表的数组（以数字数组为例）
 *
 */
+ (LinkedList *)createNoCircleAndSinglyLinkedList:(NSArray *)array;

/**
 * desc: 创建首尾不相连的双向链表
 *
 * params: array 构建链表的数组（以数字数组为例）
 *
 */
+ (LinkedList *)createSinglyLinkedList:(NSArray *)array;

/**
 * desc: 创建首尾相连的双向链表
 *
 * params: array 构建链表的数组（以数字数组为例）
 *
 */
+ (LinkedList *)createTwoWayLinkedList:(NSArray *)array;

/**
 * desc: 给定一个链表和一个值，对链表进行排序，使得所有小于该值的元素都在左边，大于的都在右边
 *
 * params: list 链表，val 值
 *
 */
+ (LinkedList *)reorderList:(LinkedList *)list value:(NSInteger)val;

/**
 * desc: 给定一个链表，返回链表的中间点。双指针法，一个以一倍速前进，一个以二倍速前进
 *
 * params: list 链表
 *
 */
+ (LinkedList *)getMiddleNodeInLinkedList:(LinkedList *)list;

/**
 * desc: 找到链表中距离最后一个元素k的那个元素
 *
 * params: list 链表，k 距离
 *
 */
+ (LinkedList *)getKthNodeInLinkedList:(LinkedList *)list distance:(NSInteger)k;

/**
 * desc: 给定一个可能包含环的链表，编写一个函数返回环开始的节点，如果不包含返回nil。设置两个指针，一个是单倍速，一个二倍速，如果能够相遇则说明又环，然后使得一个指针指向头节点，然后再次以单倍速前进，相遇点即为环开始的点
 *
 * params: list 链表
 *
 */
+ (LinkedList *)getStartOfCircleInLinkedList:(LinkedList *)list;

/**
 * desc: 给定一个链表，向右旋转k个位置，k是非负数，如1>2>3>4>5，k=2，旋转之后为4>5>1>2>3
 *
 * params: list 链表，k 距离
 *
 */
+ (LinkedList *)revertLinkedListWithK:(LinkedList *)list distance:(NSInteger)k;

/**
 * desc: 将链表逆转并返回新的链表头
 *
 * params: list 链表，k 距离
 *
 */
+ (LinkedList *)revertLinkedList:(LinkedList *)list;

@end
