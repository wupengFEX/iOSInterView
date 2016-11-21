//
//  NSObject+StackAndQueue.h
//  iOSInterView
//
//  Created by smart on 2016/10/27.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySortTree.h"

@interface NSArray (StackAndQueue)

/**
 * desc: 入栈操作
 *
 * params: val 入栈的值
 */
- (void)push:(id)val;

/**
 * desc: 出栈操作
 *
 */
- (id)pop;

/*
 * desc: 栈按照队列进行输出
 *
 * params: array 输入的数组
 *
 */
- (void)reverToHeap;

/*
 * desc: 如何按照升序，使用另外一个栈来排序一个栈，如按照升序来pop
 *
 * params: array 输入的数组
 *
 */
- (NSMutableArray *)sortStackWidthDoubleStack;

/*
 * desc: 给定一个二叉树，使用栈实现中序遍历
 *
 * params: array 输入的数组
 *
 */
- (void)inOrderBinaryTreeWithStack:(BinarySortTree *)root;

/*
 * desc: 给定一个字符串，他只包括'('，')','{','}','[',']',判断输入的字符串是否是一个有效的圆括号字符串
 *
 * params: array 字符串
 *
 */
+ (BOOL)judgeVaildString:(NSString *)string;

/*
 * desc: 给定一个数组，将其中的0放在数组最后
 *
 */
- (void)backZero;

/*
 * desc: 从一个数组中找到一对元素，其和是一个给数字，返回这些数字的下标
 *
 * params: array 目标数组 val 要求的值
 *
 */
+ (id)twoSum:(NSArray *)array value:(NSInteger)val;

/*
 * desc: 给定一个数组，其中三个数字相加为固定值，返回所有符合要求的数
 *
 */
- (NSMutableArray *)threeNumPlusToNum:(int)num;

@end
