//
//  ICoolUtil.m
//  Demo4
//
//  Created by Ku Jun Guo on 14-8-2.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "ICoolUtil.h"

@implementation ICoolUtil

-(void) openFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) ;
    
    NSString *documentDir = [paths objectAtIndex:0] ;
    
    NSLog(@"document dir = %@" , documentDir) ;
    
    //get the temp directory
    
    
    
}

- (NSString*) readMemo
{
    NSString * memoPath = [[NSBundle mainBundle] pathForResource:@"memo" ofType:nil];

    NSData *data ;
    
    NSFileHandle *fh = [NSFileHandle fileHandleForReadingAtPath:memoPath] ;
    
    data = [fh readDataToEndOfFile] ;
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
    
    return str ;
}

- (void) openPList
{
    NSBundle *bundle = [NSBundle mainBundle];
    // 设置资源文件名称为Property List,资源类型为plist
    NSString *path = [bundle pathForResource:@"settings" ofType:@"plist"];
    // 在plist中配置了一个NSDictionary字典,字典key为user
    NSString *username = [[[NSDictionary alloc] initWithContentsOfFile:path] objectForKey:@"username"];

    //the value can be also a dict
//    NSDictionary *dict = [[[NSDictionary alloc] initWithContentsOfFile:path] objectForKey:@"user"];
    
    NSLog(@"username = %@" , username) ;
    // 在字典中有一个key为aaa的NSArray
//    NSArray *list = [dict objectForKey:@"user_1"];
//    for (int i = 0, len = [list count]; i < len; i++) {
//        NSLog(@"%@", [list objectAtIndex:i]);
//    }
}

@end

