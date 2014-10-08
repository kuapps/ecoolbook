//
//  User.h
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-2.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString  *username ;
@property (nonatomic, copy) NSString  *passwd ;


-(id) initWith:(NSString*)username passwd:(NSString*)passwd;
          

@end
