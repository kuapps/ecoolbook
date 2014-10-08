//
//  ICoolAppDelegate.h
//  Demo4
//
//  Created by Ku Jun Guo on 14-7-31.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndexViewController;
@class TableViewController;
@class MyViewController;
@class TextViewController;

@interface ICoolAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IndexViewController *indexviewController;

@property (strong, nonatomic) TableViewController *tableviewController;

@property (strong, nonatomic) TextViewController *textviewController;

@property (strong, nonatomic) MyViewController *myController;

- (void) switchViewController:(UIViewController*)viewController ;


@end
