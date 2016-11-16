//
//  StringStruct.m
//  iOSInterView
//
//  Created by wupeng10 on 2016/11/10.
//  Copyright © 2016年 smartfutureplayer@gmail.com. All rights reserved.
//

#import "StringStruct.h"

@implementation StringStruct

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


@end
