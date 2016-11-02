//
//  GraphTheory.m
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/2.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "GraphTheory.h"

static NSMutableArray *queue;

@implementation GraphTheory

+ (GraphNode *)createGraphWithInfo:(BOOL)isDG numberOfVex:(int)verNum numberOfArc:(int)arcNum vexArray:(NSArray *)vexs arcInfo:(NSArray *)arcInfo {
    
    if (!([vexs isKindOfClass:[NSArray class]] && [vexs count])) {
        return nil;
    }
    if (!([arcInfo isKindOfClass:[NSArray class]] && [arcInfo count])) {
        return nil;
    }
    
    GraphNode *graph = [[GraphNode alloc] init];
    // 是否是有向图
    if (isDG) {
        graph.graphType = 1;
    }
    else {
        graph.graphType = 0;
    }
    // 顶点数目
    graph.verNum = verNum;
    // 弧的数目
    graph.arcNum = arcNum;
    // 顶点数组
    graph.vers = [[NSMutableArray alloc] initWithArray:vexs];
    // 初始化矩阵
    for (int i = 0; i < verNum; i++) {
        graph.arcs[i] = [[NSMutableArray alloc] initWithCapacity:arcNum];
        for (int j = 0; j < verNum; j++) {
            graph.arcs[i][j] = [NSNumber numberWithInteger:0];
        }
    }
    // 弧的数组
    for (int i = 0; i < arcNum; i++) {
        int start = [self getIndexOfVexs:graph nodeName:[arcInfo[i] valueForKey:@"start"]];
        int end = [self getIndexOfVexs:graph nodeName:[arcInfo[i] valueForKey:@"end"]];
        id weight = [arcInfo[i] valueForKey:@"weight"];
        
        if (graph.graphType == 0) {
            graph.arcs[start][end] = graph.arcs[end][start] = weight;
        }
        else {
            graph.arcs[start][end] = weight;
        }
    }
    return graph;
}

+ (int)getIndexOfVexs:(GraphNode *)graph nodeName:(NSString *)name {
    if (!(graph && [graph isKindOfClass:[GraphNode class]])) {
        return 0;
    }
    
    for (int i = 0; i < graph.verNum; i++) {
        if ([graph.vers[i] isEqualToString:name]) {
            return i;
        }
    }
    
    return 0;
}

// 深度优先遍历
+ (void)graphDFS:(GraphNode *)graph {
    if (!(graph && [graph isKindOfClass:[GraphNode class]])) {
        return;
    }
    
    for (int i = 0; i < graph.verNum; i++) {
        graph.isTrav[i] = [NSNumber numberWithInteger:0];
    }
    
    for (int i = 0; i < graph.verNum; i++) {
        if (![graph.isTrav[i] boolValue]) {
            [self DFS:graph nodeIndex:i];
        }
    }
}

+ (void)DFS:(GraphNode *)graph nodeIndex:(int)index {
    if (!(graph && [graph isKindOfClass:[GraphNode class]])) {
        return;
    }
    
    NSLog(@"访问过的节点是：%@", graph.vers[index]);
    graph.isTrav[index] = [NSNumber numberWithInteger:1];
    for (int j = 0; j < graph.verNum; j++) {
        if ([graph.isTrav[j] intValue] == 0 && [graph.arcs[index][j] intValue] > 0) {
            [self DFS:graph nodeIndex:j];
        }
    }
}

+ (void)graphBFS:(GraphNode *)graph {
    if (!(graph && [graph isKindOfClass:[GraphNode class]])) {
        return;
    }
    if (nil == queue) {
        queue = [[NSMutableArray alloc] init];
    }
    
    for (int i = 0; i < graph.verNum; i++) {
        graph.isTrav[i] = [NSNumber numberWithInteger:0];
    }
    
    for (int i = 0; i < graph.verNum; i++) {
        if (![graph.isTrav[i] boolValue]) {
            [self BFS:graph nodeIndex:i];
        }
    }
}

+ (void)BFS:(GraphNode *)graph nodeIndex:(int)index {
    if (!(graph && [graph isKindOfClass:[GraphNode class]])) {
        return;
    }
    
    graph.isTrav[index] = [NSNumber numberWithInteger:1];
    [queue addObject:[NSNumber numberWithInteger:index]];
    NSLog(@"广度优先遍历的节点是：%@", graph.vers[index]);
    
    while ([queue count] > 0) {
        int k = [[queue objectAtIndex:0] intValue];
        [queue removeObjectAtIndex:0];
        
        for (int i = 0; i < graph.verNum; i++) {
            if ([graph.arcs[k][i] intValue] && [graph.isTrav[i] intValue] == 0) {
                NSLog(@"广度优先遍历的节点是：%@", graph.vers[i]);
                graph.isTrav[i] = [NSNumber numberWithInteger:1];
                [queue addObject:[NSNumber numberWithBool:i]];
            }
        }
    }
    
}

@end
