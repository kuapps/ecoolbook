//
//  SQLiteManager.h
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-2.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteManager : NSObject

-(sqlite3*) openDB;
-(NSMutableArray*) queryDB;
-(void) insert:(NSString*)username passwd:(NSString*)passwd;

-(NSMutableArray*) listUsers;
@end
