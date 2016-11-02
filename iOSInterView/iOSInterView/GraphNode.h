//
//  GraphNode.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/2.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphNode : NSObject

// 保存顶点信息
@property (nonatomic, strong) NSMutableArray *vers;
// 保存边的权值
@property (nonatomic, strong) NSMutableArray *arcs;
// 是否遍历
@property (nonatomic, strong) NSMutableArray *isTrav;
// 顶点数目
@property (nonatomic, assign) int verNum;
// 边的数目
@property (nonatomic, assign) int arcNum;
// 图的类型，0是无向图，1是有向图
@property (nonatomic, assign) int graphType;
// 是否被访问过

@end
