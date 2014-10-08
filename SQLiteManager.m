//
//  SQLiteManager.m
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-2.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "SQLiteManager.h"
#import "User.h"

@implementation SQLiteManager

-(sqlite3*) openDB
{
    NSString * databasePaths = [[NSBundle mainBundle] pathForResource:@"CoolDB" ofType:@"db"];
    //打开数据库连接
    sqlite3 * database;
    if (sqlite3_open([databasePaths UTF8String], &database) == SQLITE_OK) {
        NSLog(@"连接成功！");
    }else{
        NSLog(@"连接失败！");
    }

    return database ;
    
    
    
}

-(NSMutableArray*) listUsers
{
    //    NSMutableArray *results = [NSMutableArray arrayWithCapacity:10] ;
    sqlite3* database = [self openDB];
    
    const char * selectSQL = "select * from userinfo";
    sqlite3_stmt * stmt;
    // 预编译SQL语句，stmt变量保存了预编译结果的指针
    int queryResult = sqlite3_prepare_v2(database
                                         , selectSQL, -1, &stmt, nil);
    NSMutableArray* result = [[NSMutableArray alloc] init];
    // 如果预编译成功
    if(queryResult == SQLITE_OK)
    {
        // 为第一个?占位符绑定参数
        //        sqlite3_bind_text(stmt, 1, [[NSString stringWithFormat:@"%%%@%%"
        //                                     , key] UTF8String], -1, NULL);
        // 采用循环多次执行sqlite3_step()函数，并从中取出查询结果
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            // 分别获取当前行的不同列的查询数据
            //            int word_id = sqlite3_column_int(stmt , 0);
            char* username = (char*)sqlite3_column_text(stmt , 1);
            char* password = (char*)sqlite3_column_text(stmt , 2);
            
            NSLog(@"username = %s" ,username ) ;
            
            // 将当前行的数据封装成User对象
            User * user = [[User alloc] initWith: [NSString stringWithUTF8String:username] passwd:[NSString stringWithUTF8String:password]];
            [result addObject:user];
        }
    }
    // 关闭数据库
    sqlite3_close(database);
    return result ;
    
    
}



-(NSMutableArray*) queryDB
{
//    NSMutableArray *results = [NSMutableArray arrayWithCapacity:10] ;
    sqlite3* database;
    // 新建或打开数据库，database变量保存了打开的数据库的指针
    sqlite3_open([[self dbPath] UTF8String], &database);
    const char * selectSQL = "select * from userinfo";
    sqlite3_stmt * stmt;
    // 预编译SQL语句，stmt变量保存了预编译结果的指针
    int queryResult = sqlite3_prepare_v2(database
                                         , selectSQL, -1, &stmt, nil);
    NSMutableArray* result = [[NSMutableArray alloc] init];
    // 如果预编译成功
    if(queryResult == SQLITE_OK)
    {
        // 为第一个?占位符绑定参数
//        sqlite3_bind_text(stmt, 1, [[NSString stringWithFormat:@"%%%@%%"
//                                     , key] UTF8String], -1, NULL);
        // 采用循环多次执行sqlite3_step()函数，并从中取出查询结果
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            // 分别获取当前行的不同列的查询数据
//            int word_id = sqlite3_column_int(stmt , 0);
            char* username = (char*)sqlite3_column_text(stmt , 1);
            char* password = (char*)sqlite3_column_text(stmt , 2);
            
            NSLog(@"username = %s" ,username ) ;
            
            // 将当前行的数据封装成FKWord对象
            User * user = [[User alloc] initWith: [NSString stringWithUTF8String:username] passwd:[NSString stringWithUTF8String:password]];
            [result addObject:user];
        }
    }
    // 关闭数据库
    sqlite3_close(database);
    return result ;
    
    
}

-(void) insert:(NSString*)username passwd:(NSString*)passwd
{
    sqlite3* database;
    // 新建和打开数据库，database变量保存了打开的数据库的指针
    sqlite3_open([[self dbPath] UTF8String], &database);
    // 定义错误字符串
    char * errMsg;
    // 定义执行建表的SQL语句
    const char * createSQL = "create table if not exists userinfo \
    (_id integer primary key autoincrement,\
    username,\
    passwd)";
    // 执行建表语句
    int result = sqlite3_exec(database, createSQL, NULL, NULL, &errMsg);
    if (result == SQLITE_OK)
    {
        const char * insertSQL = "insert into userinfo values(null, ? , ?)";
        sqlite3_stmt * stmt;
        // 预编译SQL语句，stmt变量保存了预编译结果的指针
        int insertResult = sqlite3_prepare_v2(database
                                              , insertSQL, -1, &stmt, nil);
        // 如果预编译成功
        if (insertResult == SQLITE_OK)
        {
            // 为第一个?占位符绑定参数
            sqlite3_bind_text(stmt, 1,
                              [username UTF8String], -1, NULL);
            // 为第二个?占位符绑定参数
            sqlite3_bind_text(stmt, 2,
                              [passwd UTF8String], -1, NULL);
            // 执行SQL语句
            sqlite3_step(stmt);
            // 将wordField、detailField控件的内容清空
            
        }
        sqlite3_finalize(stmt);
    }
    // 关闭数据库
    sqlite3_close(database);
    
}

- (NSString*) dbPath
{
	// 获取应用的Documents路径
	NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSDocumentDirectory, NSUserDomainMask, YES);
    
	NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"db path = %@" , documentsDirectory) ;
    
	return [NSString stringWithFormat:@"%@/CoolDB.db"
            , documentsDirectory];
}
@end
