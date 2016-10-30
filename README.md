# iOSInterView

工程中会包含一些iOS面试中的算法和数据结构相关题目，通过objective c来实现，目前包含链表、二叉树、栈、队列、排序等的部分，持续更新中...

### 二叉树

```/**
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
```

### 链表
```
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
```
