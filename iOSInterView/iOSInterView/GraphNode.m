//
//  GraphNode.m
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/2.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "GraphNode.h"

@implementation GraphNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arcs = [[NSMutableArray alloc] init];
        self.vers = [[NSMutableArray alloc] init];
        self.isTrav = [[NSMutableArray alloc] init];        
    }
    return self;
}

@end
