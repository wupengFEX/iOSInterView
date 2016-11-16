//
//  StringStruct.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/10.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringStruct : NSObject

// 判断是否是回文
+ (BOOL)isPanlindrome:(NSString *)str;

+ (NSString *)convertString:(NSString *)str withKey:(NSString *)key;

@end
