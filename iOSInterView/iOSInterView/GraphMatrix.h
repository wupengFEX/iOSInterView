//
//  GraphMatrix.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/8.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GraphNode;

@interface GraphMatrix : NSObject

// 顶点集合
@property (nonatomic, strong) NSMutableArray *vers;
// 邻接矩阵
@property (nonatomic, strong) NSMutableArray *matrix;
// 顶点数
@property (nonatomic, assign) int verNum;
// 边数
@property (nonatomic, assign) int arcNum;
// 图的类型，0是无向图，1是有向图
@property (nonatomic, assign) int graphType;

@end


@interface GraphMatrixNode : NSObject

// 节点数据
@property (nonatomic, assign) id data;
// 下一个节点的指针
@property (nonatomic, strong) GraphMatrixNode *next;

@end
