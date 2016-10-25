//
//  LinkedList.m
//  BinaryTree
//
//  Created by smart on 2016/10/24.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

// 打印链表的值，打印不带环的链表
+ (void)printfLinkedList:(LinkedList *)list {
    
    LinkedList *listCopy = list;
    
    while (listCopy) {
        NSLog(@"%@", [NSNumber numberWithInteger:listCopy.data]);
        listCopy = listCopy.next;
    }
}

// 创建首尾不相连的单向链表
+ (LinkedList *)createNoCircleAndSinglyLinkedList:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    LinkedList *head = [[LinkedList alloc] init];
    head.data = [[array objectAtIndex:0] intValue];
    
    LinkedList *parentNode = head;
    for (NSInteger i = 1; i < [array count]; i++) {
        LinkedList *node = [[LinkedList alloc] init];
        node.data = [[array objectAtIndex:i] intValue];
        
        parentNode.next = node;
        parentNode = node;
    }
    
    return head;
}

// 创建首尾不相连的双向链表
+ (LinkedList *)createSinglyLinkedList:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    LinkedList *head = [[LinkedList alloc] init];
    head.data = [[array objectAtIndex:0] intValue];
    
    LinkedList *parentNode = head;
    for (NSInteger i = 1; i < [array count]; i++) {
        LinkedList *node = [[LinkedList alloc] init];
        node.data = [[array objectAtIndex:i] intValue];
        node.prev = parentNode;
        
        parentNode.next = node;
        parentNode = node;
    }
    
    return head;
}

// 创建首尾相连的双向链表
+ (LinkedList *)createTwoWayLinkedList:(NSArray *)array {
    if (!([array isKindOfClass:[NSArray class]] && [array count] > 0)) {
        return nil;
    }
    
    LinkedList *head = [[LinkedList alloc] init];
    head.data = [[array objectAtIndex:0] intValue];
    
    LinkedList *parentNode = head;
    for (NSInteger i = 1; i < [array count]; i++) {
        LinkedList *node = [[LinkedList alloc] init];
        node.data = [[array objectAtIndex:i] intValue];
        node.prev = parentNode;
        
        parentNode.next = node;
        parentNode = node;
    }
    
    parentNode.next = head;
    head.prev = parentNode;
    
    return head;
}

// 给定一个链表和一个值，对链表进行排序，使得所有小于该值的元素都在左边，大于的都在右边
+ (LinkedList *)reorderList:(LinkedList *)list value:(NSInteger)val {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *listA = [[LinkedList alloc] init];
    LinkedList *listACopy = listA;
    LinkedList *listB = [[LinkedList alloc] init];
    LinkedList *listBCopy = listB;
    
    while (list) {
        LinkedList *next = list.next;
        list.next = nil;
        
        if (list.data < val) {
            listACopy.next = list;
            listACopy = list;
        }
        else {
            listBCopy.next = list;
            listBCopy = list;
        }
        list = next;
    }
    listACopy.next = listB.next;

    return listA.next;
}

// 给定一个链表，返回链表的中间点
+ (LinkedList *)getMiddleNodeInLinkedList:(LinkedList *)list {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *runner = list;
    LinkedList *header = list;    
    
    while (header.next && runner.next.next) {
        header = header.next;
        runner = runner.next.next;
    }
    
    return header;
}

// 找到链表中距离最后一个元素k的那个元素
+ (LinkedList *)getKthNodeInLinkedList:(LinkedList *)list distance:(NSInteger)k {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *runner = list;
    LinkedList *header = list;
    
    for (NSInteger i = 0; i < k; i++) {
        runner = runner.next;
    }
    
    if (nil == runner) {
        return nil;
    }
    
    while (runner.next) {
        runner = runner.next;
        header = header.next;
    }
    
    return header;
}

// 给定一个可能包含环的链表，编写一个函数返回环开始的节点，如果不包含返回nil
+ (LinkedList *)getStartOfCircleInLinkedList:(LinkedList *)list {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *runner = list;
    LinkedList *header = list;
    
    while (nil != runner && nil != runner.next) {
        header = header.next;
        runner = runner.next.next;
        if (header == runner) {
            break;
        }
    }
    
    if (nil == runner && nil == runner.next) {
        return nil;
    }
    
    header = list;
    while (runner != header) {
        runner = runner.next;
        header = header.next;
    }
    return runner;
}

// 给定一个链表，向右旋转k个位置，k是非负数，如1>2>3>4>5，k=2，旋转之后为4>5>1>2>3
+ (LinkedList *)revertLinkedListWithK:(LinkedList *)list distance:(NSInteger)k {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *runner = list;
    LinkedList *newHeader;
    NSInteger len = 1;
    while (runner.next) {
        len++;
        runner = runner.next;
    }
    runner.next = list;
    runner = runner.next;
    
    for (NSInteger i = 0; i < len - k - 1; i++) {
        runner = runner.next;
    }
    newHeader = runner.next;
    runner.next = nil;
    return newHeader;
}


// 将链表逆转并返回新的链表头
+ (LinkedList *)revertLinkedList:(LinkedList *)list {
    if (!(nil != list && [list isKindOfClass:[LinkedList class]])) {
        return nil;
    }
    
    LinkedList *nextNode;
    LinkedList *prevNode;
    while (list) {
        nextNode = list.next;
        list.next = prevNode;
        prevNode = list;
        list = nextNode;
    }
    return prevNode;
}

@end
