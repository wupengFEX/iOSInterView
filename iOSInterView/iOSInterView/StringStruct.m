//
//  StringStruct.m
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/10.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "StringStruct.h"

@implementation StringStruct

// 判断是否是回文
+ (BOOL)isPanlindrome:(NSString *)str {
    if (!([str isKindOfClass:[NSString class]] && str.length > 0)) {
        return NO;
    }

    int i = 0;
    int j = (int)str.length - 1;
    
    while (i < j) {
        char c = [str characterAtIndex:i];
        char d = [str characterAtIndex:j];;
        if (![self isVaildChar:c]) {
            i++;
            continue;
        }
        
        if (![self isVaildChar:d]) {
            j--;
            continue;
        }
        
        if ([self lowerCase:c] != [self lowerCase:d]) {
            return NO;
        }
        i++;
        j--;
    }
    return YES;
}

+ (BOOL)isVaildChar:(char)c {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

+ (char)lowerCase:(char)character {
    if (character >= 'A' && character <= 'Z') {
        character = character - 'A' + 'a';
    }
    return character;
}

// 根据遍历str,key的数字，结果是str的字母加上key的数字的字母，如果大于z/Z,则循环展示
+ (NSString *)convertString:(NSString *)str withKey:(NSString *)key {
    if (str.length == 0 || key.length == 0) {
        return nil;
    }
    
    NSString *newStr = @"";
    int j = 0;
    
    for (int i = 0; i < str.length; i++) {
        char character = [str characterAtIndex:i];
        int keyChar;
        char characterOne = character;
        
        if (character >= 'a' && character <= 'z') {
            keyChar = [[key substringWithRange:NSMakeRange(j % key.length, 1)] intValue];
            characterOne = (character + keyChar) > 'z' ? ('a' + (character + keyChar) % 'z' - 1) : (character + keyChar);
            j++;
        }
        else if (character >= 'A' && character <= 'Z') {
            keyChar = [[key substringWithRange:NSMakeRange(j % key.length, 1)] intValue];            
            characterOne = (character + keyChar) > 'Z' ? ('A' + (character + keyChar) % 'Z' - 1) : (character + keyChar);
            j++;
        }
        
        newStr = [newStr stringByAppendingFormat:@"%c", characterOne];
        NSLog(@"%c", characterOne);
    }
    return newStr;
}

// 判断一个字符串中所有字符都是唯一的
+ (BOOL)isUnique:(NSString *)str {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    BOOL isUnique = YES;
    
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *character = [str substringWithRange:NSMakeRange(i, 1)];
        if (character && !dict[character]) {
            dict[character] = @"1";
        }
        else {
            isUnique = NO;
            break;
        }
    }
    return isUnique;
}


// 两个字符串str，mainStr，判断是否能够使用str中的字符串来组成mainStr
+ (BOOL)isContainString:(NSString *)mainStr combineString:(NSString *)str {
    if (!(mainStr.length > 0 &&
          str.length > 0 &&
          str.length > mainStr.length)) {
        return NO;
    }
    
    BOOL isContain = YES;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < str.length; i++) {
        NSString *character = [str substringWithRange:NSMakeRange(i, 1)];
        dict[character] = [NSNumber numberWithInteger:([dict[character] intValue] + 1)];
    }
    
    for (NSInteger i = 0; i < mainStr.length; i++) {
        NSString *character = [str substringWithRange:NSMakeRange(i, 1)];
        if ([dict[character] intValue]) {
            dict[character] = [NSNumber numberWithInteger:[dict[character] intValue] - 1];
        }
        else {
            isContain = NO;
            break;
        }
    }
    
    return isContain;
}

// 判断两个字符串是否可以置换
+ (BOOL)permutaionString:(NSString *)strA another:(NSString *)strB {
    if (strA.length != strB.length) {
        return NO;
    }
    
    NSMutableDictionary *dictA = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dictB = [[NSMutableDictionary alloc] init];
    for (NSInteger i = 0; i < strA.length; i++) {
        NSString *charA = [strA substringWithRange:NSMakeRange(i, 1)];
        NSString *charB = [strB substringWithRange:NSMakeRange(i, 1)];
        dictA[charA] = [NSNumber numberWithInteger:[dictA[charA] intValue] + 1];
        dictB[charB] = [NSNumber numberWithInteger:[dictB[charA] intValue] + 1];
    }
    
    for (NSString *key in [dictA allKeys]) {
        if (dictB[key]) {
            dictB[key] = [NSNumber numberWithInteger:[dictB[key] intValue] - 1];
        }
        else {
            return NO;
        }
    }
    
    return YES;
}

@end
