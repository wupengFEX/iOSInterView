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

###栈和队列
```
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
```

###排序
```
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
```
