//
//  User.m
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-2.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "User.h"

@implementation User

-(id) initWith:(NSString*)username passwd:(NSString*)passwd
{
    self = [super init];
    if (self) {
        _username = username;
		_passwd = passwd ;
    }
    return self;
}

@end
