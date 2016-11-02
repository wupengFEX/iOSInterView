//
//  GraphTheory.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/2.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphNode.h"

@interface GraphTheory : NSObject

/**
 * desc：通过邻接矩阵的形式创建图
 *
 * params: isDG 是否是有向图，1是，0否 verNum 顶点总数，arcNum 弧的总数，vexs 顶点数组，arcInfo 弧信息，包括起始点，终止点，以及权重
 *
 */
+ (GraphNode *)createGraphWithInfo:(BOOL)isDG numberOfVex:(int)verNum numberOfArc:(int)arcNum vexArray:(NSArray *)vexs arcInfo:(NSArray *)arcInfo;

/**
 * desc：深度优先遍历
 *
 * params: graph 图
 *
 */
+ (void)graphDFS:(GraphNode *)graph;

/**
 * desc：广度优先遍历
 *
 * params: graph 图
 *
 */
+ (void)graphBFS:(GraphNode *)graph;

@end
