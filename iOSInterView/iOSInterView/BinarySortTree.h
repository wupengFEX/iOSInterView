//
//  BinarySortTree.h
//  BinaryTree
//
//  Created by smart on 2016/10/21.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySortTree : NSObject

/*
 * 左孩子
 */
@property (nonatomic, strong) BinarySortTree *leftNode;
/*
 * 右孩子
 */
@property (nonatomic, strong) BinarySortTree *rightNode;
/*
 * 节点值
 */
@property (nonatomic, assign) NSInteger value;

/**
 * desc: 二叉排序树的创建，每次都要从顶部元素开始遍历，小于其的放在左边，大于的放在右边
 *
 * params：根结点，node的值
 *
 */
+ (BinarySortTree *)binarySortTreeCreate:(NSArray *)tree;

/**
 * desc: 先序遍历
 *
 * params: 根结点，压栈操作的block
 *
 */
+ (void)preOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler;

/**
 * desc: 中序遍历
 *
 * params: 根结点，压栈操作的block
 *
 */
+ (void)inOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler;

/**
 * desc: 后序遍历
 *
 * params: 根结点，压栈操作的block
 *
 */
+ (void)postOrderTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler;

/**
 * desc: 层次遍历（广度优先）
 *
 * params: 根结点，压栈操作的block
 *
 */
+ (void)levelTraverseTree:(BinarySortTree *)root handler:(void(^)(BinarySortTree *node))handler;

/**
 * desc: 返回二叉树的深度
 *
 * params: root 跟节点
 *
 */
+ (NSInteger)depthOfTree:(BinarySortTree *)root;

/**
 * desc: 返回二叉树的宽度
 *
 * params: root 跟节点
 *
 */
+ (NSInteger)widthOfTree:(BinarySortTree *)root;

/**
 * desc: 返回二叉树的全部节点数
 *
 * params: root 跟节点
 *
 */
+ (NSInteger)numbersOfNodesInTree:(BinarySortTree *)root;

/**
 * desc: 返回二叉树的叶子节点
 *
 * params: root 跟节点
 *
 */
+ (NSInteger)numbersOfLeafsInTree:(BinarySortTree *)root;

/**
 * desc: 返回二叉树中某个节点到跟节点的路径
 *
 * params: root 跟节点，node 指定节点
 *
 */
+ (NSMutableArray *)pathOfNodeInTree:(BinarySortTree *)root searchNode:(BinarySortTree *)node;

/**
 * desc: 二叉树中两个节点最近的公共父节点
 *
 * params: root 跟节点，nodeA/nodeB 两节点
 *
 */
+ (BinarySortTree *)publicNodeOfTwoNodesIntree:(BinarySortTree *)root nodeA:(BinarySortTree *)nodeA nodeB:(BinarySortTree *)nodeB;

/**
 * desc: 二叉树两个节点之间的距离
 *
 * params: root 跟节点，nodeA/nodeB 两节点
 *
 */
+ (NSInteger)distanceOfTwoNodesInTree:(BinarySortTree *)root nodeA:(BinarySortTree *)nodeA nodeB:(BinarySortTree *)nodeB;

/**
 * desc: 翻转二叉树
 *
 * params: root 跟节点
 *
 */
+ (BinarySortTree *)invertBinaryTree:(BinarySortTree *)root;

/**
 * desc: 判断二叉树是否完全二叉树
 *
 * params: root 跟节点
 *
 */
+ (BOOL)isCompleteBinaryTree:(BinarySortTree *)root;

/**
 * desc: 判断二叉树是否满二叉树
 *
 * params: root 跟节点
 *
 */
+ (BOOL)isFullBinaryTree:(BinarySortTree *)root;

/**
 * desc: 判断二叉树是否平衡二叉树
 *
 * params: root 跟节点
 *
 */
+ (BOOL)isAVLBinaryTree:(BinarySortTree *)root;

/**
 * desc: 返回二叉树第i层节点数
 *
 * params: root 跟节点，level 层级
 *
 */
+ (NSInteger)numbersOfLevelInTree:(BinarySortTree *)root level:(NSInteger)level;

/**
 * desc: 二叉排序树插入节点
 *
 * params：根结点，插入的值
 *
 */
+ (BinarySortTree *)insertNodeToTree:(BinarySortTree *)root nodeValue:(NSInteger)value;

/**
 * desc: 删除排序二叉树中的节点，三种情况：1.删除节点是叶子结点，2.删除节点只有左/右子树，3.删除节点左右子树都有
 *
 * params：根结点，插入的值
 *
 */
+ (void)deleteNodeInTree:(BinarySortTree *)root deleteNode:(NSInteger)value;

/**
 * desc: 判断一棵树是否是二叉搜索树，二叉搜索树特点：父节点的值大于所有左子树的值，小于所有右子树的值，前提是假设所有值没有相同的
 *
 * params：根结点，插入的值
 *
 */
+ (BOOL)isBinarySearchTree:(BinarySortTree *)root;

/**
 * desc: 判断一棵树是否是另一棵树的子树
 *
 * params：root 父树根节点，childNode 子树根节点
 *
 */
+ (BOOL)isContainTree:(BinarySortTree *)root childNode:(BinarySortTree *)childNode;

/**
 * desc: 找出一棵二叉树中所有路径，并且其路径之和等于一个给定的值
 *
 * params: root 根节点，path 暂时存储路径的数组，vector 返回最终符合要求的数组，sum 给定值
 */
+ (void)findAllPathInTree:(BinarySortTree *)root pathArray:(NSMutableArray *)path vectore:(NSMutableArray *)vectore sum:(NSInteger)sum;

/**
 * desc: 找出二叉树中一个节点的后继
 *
 * params: root 根节点，node 目标节点
 */
+ (BinarySortTree *)findSuccessor:(BinarySortTree *)root searchNode:(BinarySortTree *)node;

/**
 * desc: 找出二叉树中一个节点的前驱
 *
 * params: root 根节点，node 目标节点
 */
+ (BinarySortTree *)findPrecursor:(BinarySortTree *)root searchNode:(BinarySortTree *)node;

@end
