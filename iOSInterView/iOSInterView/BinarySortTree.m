//
//  BinarySortTree.m
//  BinaryTree
//
//  Created by smart on 2016/10/21.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "BinarySortTree.h"

@interface BinarySortTree ()

@property (nonatomic, assign) NSInteger nodeIndex;

@end

@implementation BinarySortTree

// 二叉排序树的创建
+ (BinarySortTree *)binarySortTreeCreate:(NSArray *)tree {
    if (!([tree isKindOfClass:[NSArray class]] && [tree count] > 0)) {
        return nil;
    }
    
    BinarySortTree *root = nil;
    for (NSInteger i = 0; i < [tree count]; i++) {
        root = [self insertNodeToTree:root nodeValue:[[tree objectAtIndex:i] intValue]];
    }
    
    return root;
}

// 二叉排序树的创建
+ (BinarySortTree *)insertNodeToTree:(BinarySortTree *)root nodeValue:(NSInteger)value {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        root = [[BinarySortTree alloc] init];
        root.value = value;
    }
    else if (root.value == value) {
        NSException *exception = [NSException
                          exceptionWithName: @"不能构建二叉排序树"
                          reason: @"由于有相同元素，从而不能构建二叉排序树"
                          userInfo: nil];
        @throw exception;
    }
    else if (root.value > value) {
        root.leftNode = [self insertNodeToTree:root.leftNode nodeValue:value];
    }
    else if (root.value < value) {
        root.rightNode = [self insertNodeToTree:root.rightNode nodeValue:value];
    }
    
    return root;
}

// 先序遍历
+ (void)preOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    if (handler) {
        handler(root);
    }
    [self preOrderTraverseTree:root.leftNode handler:handler];
    [self preOrderTraverseTree:root.rightNode handler:handler];
}

// 中序遍历
+ (void)inOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    [self inOrderTraverseTree:root.leftNode handler:handler];
    if (handler) {
        handler(root);
    }
    [self inOrderTraverseTree:root.rightNode handler:handler];
}

// 后序遍历
+ (void)postOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    [self postOrderTraverseTree:root.leftNode handler:handler];
    [self postOrderTraverseTree:root.rightNode handler:handler];
    if (handler) {
        handler(root);
    }
}

// 层次遍历（广度优先）
+ (void)levelTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    NSMutableArray *treeNode = [[NSMutableArray alloc] init];
    [treeNode addObject:root];
    
    while ([treeNode count] > 0) {
        BinarySortTree *currentNode = [treeNode firstObject];
        if (handler) {
            handler(currentNode);
        }
        [treeNode removeObjectAtIndex:0];
        if (currentNode.leftNode) {
            [treeNode addObject:currentNode.leftNode];
        }
        if (currentNode.rightNode) {
            [treeNode addObject:currentNode.rightNode];
        }
    }
}

// 返回二叉树的深度
+ (NSInteger)depthOfTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return 0;
    }
    
    if (nil == root.leftNode && nil == root.rightNode) {
        return 1;
    }
    
    NSInteger leftTreeDepth = [self depthOfTree:root.leftNode];
    NSInteger rightTreeDepth = [self depthOfTree:root.rightNode];
    return MAX(leftTreeDepth, rightTreeDepth) + 1;
}

// 返回二叉树的宽度
+ (NSInteger)widthOfTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return 0;
    }
    
    NSInteger currentWidth = 0;
    NSInteger maxWidth = 1;
    NSMutableArray *treeNode = [[NSMutableArray alloc] init];
    [treeNode addObject:root];
    
    while ([treeNode count] > 0) {
        currentWidth = [treeNode count];
        for (NSInteger i = 0; i < currentWidth; i++) {
            BinarySortTree *currentNode = [treeNode firstObject];
            if ([currentNode isKindOfClass:[BinarySortTree class]]) {
                if (currentNode.leftNode) {
                    [treeNode addObject:currentNode.leftNode];
                }
                if (currentNode.rightNode) {
                    [treeNode addObject:currentNode.rightNode];
                }
            }
            [treeNode removeObjectAtIndex:0];
        }
        maxWidth = MAX(currentWidth, maxWidth);
    }
    return maxWidth;
}

// 返回二叉树的全部节点数
+ (NSInteger)numbersOfNodesInTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return 0;
    }

    return [self numbersOfNodesInTree:root.leftNode] + [self numbersOfNodesInTree:root.rightNode] + 1;
}

// 返回二叉树的叶子节点
+ (NSInteger)numbersOfLeafsInTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return 0;
    }
    
    if (nil == root.leftNode && nil == root.rightNode) {
        return 1;
    }
    
    return [self numbersOfLeafsInTree:root.leftNode] + [self numbersOfLeafsInTree:root.rightNode];
}

// 返回二叉树第i层节点数
+ (NSInteger)numbersOfLevelInTree:(BinarySortTree *)root level:(NSInteger)level {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]]) || level < 1) {
        return 0;
    }
    
    if (level == 1) {
        return 1;
    }
    
    return [self numbersOfLevelInTree:root.leftNode level:(level - 1)] + [self numbersOfLevelInTree:root.rightNode level:(level - 1)];
}

// 返回二叉树中某个节点到跟节点的路径
+ (NSMutableArray *)pathOfNodeInTree:(BinarySortTree *)root searchNode:(BinarySortTree *)node {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    if (!(nil != node && [node isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    NSMutableArray *pathArray = [[NSMutableArray alloc] init];
    [self findNodeInTree:root searchNode:node pathArray:pathArray];
    
    return pathArray;
}

+ (BOOL)findNodeInTree:(BinarySortTree *)root searchNode:(BinarySortTree *)node pathArray:(NSMutableArray *)pathArray {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    if (!(nil != node && [node isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    if (root == node) {
        [pathArray addObject:root];
        return YES;
    }
    
    [pathArray addObject:root];
    
    BOOL hasFind = [self findNodeInTree:root.leftNode searchNode:node pathArray:pathArray];
    if (!hasFind) {
        hasFind = [self findNodeInTree:root.rightNode searchNode:node pathArray:pathArray];
    }
    if (!hasFind) {
        [pathArray removeLastObject];
    }
    
    return hasFind;
}

// 返回二叉树中某个节点到跟节点的路径的值
+ (NSMutableArray *)pathOfNodeValueInTree:(BinarySortTree *)root searchNode:(BinarySortTree *)node {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    if (!(nil != node && [node isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    NSMutableArray *pathArray = [[NSMutableArray alloc] init];
    [self findNodeValueInTree:root searchNode:node pathArray:pathArray];
    
    return pathArray;
}

+ (BOOL)findNodeValueInTree:(BinarySortTree *)root searchNode:(BinarySortTree *)node pathArray:(NSMutableArray *)pathArray {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    if (!(nil != node && [node isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    if (root == node) {
        [pathArray addObject:[NSNumber numberWithInteger:root.value]];
        return YES;
    }
    
    [pathArray addObject:[NSNumber numberWithInteger:root.value]];
    
    BOOL hasFind = [self findNodeValueInTree:root.leftNode searchNode:node pathArray:pathArray];
    if (!hasFind) {
        hasFind = [self findNodeValueInTree:root.rightNode searchNode:node pathArray:pathArray];
    }
    if (!hasFind) {
        [pathArray removeLastObject];
    }
    
    return hasFind;
}

// 二叉树中两个节点最近的公共父节点
+ (BinarySortTree *)publicNodeOfTwoNodesIntree:(BinarySortTree *)root nodeA:(BinarySortTree *)nodeA nodeB:(BinarySortTree *)nodeB {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]]) ||
        !(nil != nodeA && [nodeA isKindOfClass:[BinarySortTree class]]) ||
        !(nil != nodeB && [nodeB isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    if (!(nil != nodeB && [nodeB isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    
    if (nodeA == nodeB) {
        return nodeA;
    }
    
    NSArray *pathA = [self pathOfNodeInTree:root searchNode:nodeA];
    NSArray *pathB = [self pathOfNodeInTree:root searchNode:nodeB];

    // 找公共节点，这里的比较可以优化
    for (NSInteger i = [pathA count] - 1; i >= 0; i--) {
        for (NSInteger j = [pathB count] - 1; j >= 0 ; j--) {
            if ([pathA objectAtIndex:i] == [pathB objectAtIndex:j]) {
                return (BinarySortTree *)[pathA objectAtIndex:i];
            }
        }
    }
    
    return nil;
}

// 二叉树两个节点之间的距离
+ (NSInteger)distanceOfTwoNodesInTree:(BinarySortTree *)root nodeA:(BinarySortTree *)nodeA nodeB:(BinarySortTree *)nodeB {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]]) ||
        !(nil != nodeA && [nodeA isKindOfClass:[BinarySortTree class]]) ||
        !(nil != nodeB && [nodeB isKindOfClass:[BinarySortTree class]])) {
        return -1;
    }
    if (!(nil != nodeB && [nodeB isKindOfClass:[BinarySortTree class]])) {
        return -1;
    }

    NSMutableArray *pathArray = [[NSMutableArray alloc] init];
    if (nodeA == nodeB) {
        [pathArray addObject:nodeB];
        return 0;
    }
    
    NSArray *pathA = [self pathOfNodeValueInTree:root searchNode:nodeA];
    NSArray *pathB = [self pathOfNodeValueInTree:root searchNode:nodeB];
    // 这里的比较可以优化
    for (NSInteger i = [pathA count] - 1; i >= 0; i--) {
        for (NSInteger j = [pathB count] - 1; j >= 0 ; j--) {
            if ([pathA objectAtIndex:i] == [pathB objectAtIndex:j]) {
                return [pathA count] - i + [pathB count] - j - 2;
            }
        }
    }
    
    return -1;
}

// 翻转二叉树
+ (BinarySortTree *)invertBinaryTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    
    if (nil == root.leftNode && nil == root.rightNode) {
        return root;
    }
    
    [self invertBinaryTree:root.leftNode];
    [self invertBinaryTree:root.rightNode];
    
    BinarySortTree *tempNode = root.leftNode;
    root.leftNode = root.rightNode;
    root.rightNode = tempNode;
    return root;
}

// 判断二叉树是否完全二叉树
+ (BOOL)isCompleteBinaryTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    
    if (nil == root.leftNode && root.rightNode) {
        return NO;
    }
    
    if (nil == root.leftNode &&
        nil == root.rightNode) {
        return YES;
    }
    
    NSMutableArray *nodeArray = [[NSMutableArray alloc] init];
    [nodeArray addObject:root];
    
    BOOL isComplete = NO;
    while ([nodeArray count]) {
        BinarySortTree *currentNode = [nodeArray firstObject];
        [nodeArray removeObjectAtIndex:0];
        if (!currentNode.leftNode && currentNode.rightNode) {
            return NO;
        }
        
        if (isComplete && (currentNode.leftNode || currentNode.rightNode)) {
            return NO;
        }
        
        if (nil == currentNode.rightNode) {
            isComplete = YES;
        }
        if (currentNode.leftNode) {
            [nodeArray addObject:currentNode.leftNode];
        }
        if (currentNode.rightNode) {
            [nodeArray addObject:currentNode.rightNode];
        }
    }
    return isComplete;
}


// 判断二叉树是否满二叉树
+ (BOOL)isFullBinaryTree:(BinarySortTree *)root {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return NO;
    }
    
    NSInteger leafs = [self numbersOfLeafsInTree:root];
    NSInteger depth = [self depthOfTree:root];
    return leafs == pow(2, depth - 1);
}

// 判断二叉树是否平衡二叉树
+ (BOOL)isAVLBinaryTree:(BinarySortTree *)root {
    static NSInteger height;
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        height = 0;
        return YES;
    }
    
    if (nil == root.leftNode && nil == root.rightNode) {
        height = 1;
        return YES;
    }
    
    [self isAVLBinaryTree:root.leftNode];
    NSInteger heightOfLeft = height;
    [self isAVLBinaryTree:root.rightNode];
    NSInteger heightOfRight = height;
    height = MAX(heightOfLeft, heightOfRight) + 1;
    
    if (heightOfLeft && heightOfRight && ABS(heightOfRight - heightOfLeft) <= 1) {
        return YES;
    }
    
    return NO;
}

// 删除排序二叉树中的节点
+ (void)deleteNodeInTree:(BinarySortTree *)root deleteNode:(NSInteger)value {
    if (!(nil != root && [root isKindOfClass:[BinarySortTree class]])) {
        return;
    }
    
    BinarySortTree *currentNode = root;
    BinarySortTree *parentNode = root;
    BOOL isLeft = YES;
    while (currentNode.value != value) {
        parentNode = currentNode;
        
        if (currentNode.value > value) {
            isLeft = YES;
            currentNode = currentNode.leftNode;
        }
        else {
            isLeft = NO;
            currentNode = currentNode.rightNode;
        }
        
        if (nil == currentNode) {
            return;
        }
    }
    
    if (nil == currentNode.leftNode && nil == currentNode.rightNode) {
        if (currentNode == root) {
            root = nil;
        }
        else if (isLeft) {
            parentNode.leftNode = nil;
        }
        else {
            parentNode.rightNode = nil;
        }
    }
    else if (nil == currentNode.leftNode) {
        if (currentNode == root) {
            root = currentNode.rightNode;
        }
        else if (isLeft) {
            parentNode.leftNode = currentNode.rightNode;
        }
        else {
            parentNode.rightNode = currentNode.rightNode;
        }
    }
    else if (nil == currentNode.rightNode) {
        if (currentNode == root) {
            root = currentNode.leftNode;
        }
        else if (isLeft) {
            parentNode.leftNode = currentNode.leftNode;
        }
        else {
            parentNode.rightNode = currentNode.leftNode;
        }
    }
    else {
        BinarySortTree *middle = [self getMiddleSortNode:currentNode];
        if (currentNode == root) {
            root = middle;
        }
        else if (isLeft) {
            parentNode.leftNode = middle;
        }
        else {
            parentNode.rightNode = middle;
        }
        middle.leftNode = currentNode.leftNode;
        NSLog(@"123");
    }
}

+ (BinarySortTree *)getMiddleSortNode:(BinarySortTree *)node {
    if (!(nil != node && [node isKindOfClass:[BinarySortTree class]])) {
        return nil;
    }
    
    BinarySortTree *middleNode = node;
    BinarySortTree *parentNode = node;
    BinarySortTree *currentNode = node.rightNode;
    
    while (nil != currentNode) {
        parentNode = middleNode;
        middleNode = currentNode;
        currentNode = currentNode.leftNode;
    }
    
    if (middleNode != node.rightNode) {
        parentNode.leftNode = middleNode.rightNode;
        middleNode.rightNode = node.rightNode;
    }
    
    return middleNode;
}

@end
