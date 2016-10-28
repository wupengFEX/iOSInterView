//
//  ViewController.m
//  iOSInterView
//
//  Created by smart on 2016/10/25.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "BinarySortTree.h"
#import "LinkedList.h"
#import "NSArray+StackAndQueue.h"
#import "NSArraySort.h"

@interface ViewController ()

@property (nonatomic, strong) BinarySortTree *root;
@property (nonatomic, strong) NSMutableArray *treeNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 二叉树测试
//    NSArray *binaryTree = @[@7,@2,@1,@4,@6,@8,@9,@34,@21,@23,@12];
//    BinarySortTree *root = [BinarySortTree binarySortTreeCreate:binaryTree];
//    
//    // 数组测试
//    NSMutableArray *stack = [[NSMutableArray alloc] init];
//    [stack push:@1];
//    [stack push:@4];
//    [stack push:@2];
//    [stack push:@5];
//    [stack push:@8];
//    [stack push:@7];
//    [stack push:@6];
////    [stack pop];
////    [stack reverToHeap];
////    [stack sortStackWidthDoubleStack];
//    [stack inOrderBinaryTreeWithStack:root];
//    NSLog(@"array is %@;", stack);
//    
//    NSString *charString = @"({[]})";
//    [NSArray judgeVaildString:charString];
    
    NSMutableArray *binaryTree = [[NSMutableArray alloc] initWithObjects:@7,@2,@1,@4,@6,@8,@9,@34,@21,@23,@12,nil];
//    NSMutableArray *array = [NSArraySort bubbleSort:binaryTree];
//    NSMutableArray *array = [NSArraySort selectSort:binaryTree];
//    NSMutableArray *array = [NSArraySort insertSort:binaryTree];
//    NSMutableArray *array = [NSArraySort mergeSort:binaryTree];
//    NSMutableArray *array = [NSArraySort quickSort:binaryTree];
    NSMutableArray *array = [NSArraySort bucketSort:binaryTree numbersOfBuckets:5];
    NSLog(@"%@", array);
}

@end
