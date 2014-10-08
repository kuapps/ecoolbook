//
//  ICoolAppDelegate.m
//  Demo4
//
//  Created by Ku Jun Guo on 14-7-31.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "ICoolAppDelegate.h"
#import "SQLiteManager.h"
#import "IndexViewController.h"
#import "TableViewController.h"
#import "TextViewController.h"
#import "MyViewController.h"
#import "ICoolUtil.h"


@implementation ICoolAppDelegate

- (void)initApp
{
//    SQLiteManager *mgr = [SQLiteManager alloc] ;
//    [mgr initDB] ;
    
}

- (void) switchViewController:(UIViewController*)viewController
{
    self.window.rootViewController = viewController ;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.indexviewController = [[IndexViewController alloc] initWithNibName:@"IndexViewController" bundle:nil];
    
    self.tableviewController = [[TableViewController alloc] initWithNibName:@"ICoolViewController" bundle:nil];
    self.textviewController = [[TextViewController alloc] initWithNibName:@"TextViewController" bundle:nil];

    self.myController = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
//    self.window.rootViewController = self.tableviewController;
    
    [self initApp] ;
    
    [self switchViewController:self.indexviewController] ;
    
    
    
    ICoolUtil *util = [ICoolUtil alloc] ;
    [util openFile] ;
    [util openPList] ;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
