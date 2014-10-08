//
//  TextViewController.m
//  CoolFullDemo
//
//  Created by Ku Jun Guo on 14-8-3.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "TextViewController.h"
#import "ICoolUtil.h"

@interface TextViewController ()

@end

@implementation TextViewController

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
    ICoolUtil* util = [ICoolUtil alloc] ;
    NSString* str = [util readMemo] ;
    
    self.content.text = str ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
