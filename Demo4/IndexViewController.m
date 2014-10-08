//
//  IndexViewController.m
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-3.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "IndexViewController.h"
#import "TableViewController.h"
#import "TextViewController.h"
#import "ICoolAppDelegate.h"

@interface IndexViewController ()

@end

@implementation IndexViewController

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
- (IBAction)showTableView:(id)sender {
    ICoolAppDelegate* delegate = [[UIApplication sharedApplication] delegate] ;
    [delegate switchViewController:delegate.tableviewController] ;
}


- (IBAction)showWebView:(id)sender {
}


- (IBAction)showTextView:(id)sender {
    ICoolAppDelegate* delegate = [[UIApplication sharedApplication] delegate] ;
    [delegate switchViewController:delegate.textviewController] ;
    
    
}

@end
