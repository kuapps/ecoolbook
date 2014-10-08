//
//  ICoolViewController.h
//  Demo4
//
//  Created by Ku Jun Guo on 14-7-31.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutlet NSMutableArray *items;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end
