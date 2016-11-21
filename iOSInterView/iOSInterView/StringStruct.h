//
//  StringStruct.h
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/10.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringStruct : NSObject

/*
 * desc: 判断是否是回文
 *
 * params: str 判断的字符串
 *
 */
+ (BOOL)isPanlindrome:(NSString *)str;

/*
 * desc: 根据遍历str,key的数字，结果是str的字母加上key的数字的字母，如果大于z/Z,则循环展示
 *
 * params: str 判断的字符串
 *
 */
+ (NSString *)convertString:(NSString *)str withKey:(NSString *)key;

/*
 * desc: 判断一个字符串中所有字符都是唯一的
 *
 * params: str 判断的字符串
 *
 */
+ (BOOL)isUnique:(NSString *)str;

/*
 * desc: 两个字符串str，mainStr，判断是否能够使用str中的字符串来组成mainStr
 *
 * params: mainStr str
 *
 */
+ (BOOL)isContainString:(NSString *)mainStr combineString:(NSString *)str;

/*
 * desc: 单词置换
 *
 * params: strA strB
 *
 */
+ (BOOL)permutaionString:(NSString *)strA another:(NSString *)strB;

@end
