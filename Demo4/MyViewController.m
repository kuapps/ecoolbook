//
//  MyViewController.m
//  Demo4
//
//  Created by Ku Jun Guo on 14-8-1.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "MyViewController.h"
#import "TableViewController.h"
#import "SQLiteManager.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onClick:(id)sender
{
    NSLog(@"OKOK") ;
    
    SQLiteManager *mgr = [SQLiteManager alloc] ;
//    [mgr insert:@"kujunguo" passwd:@"ku123"] ;
    [mgr queryDB] ;
    
    self.view.window.rootViewController = [[TableViewController alloc] initWithNibName:@"ICoolViewController" bundle:nil];
    
}

@end
