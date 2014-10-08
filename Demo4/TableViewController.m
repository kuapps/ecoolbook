//
//  ICoolViewController.m
//  Demo4
//
//  Created by Ku Jun Guo on 14-7-31.
//  Copyright (c) 2014年 Ku Jun Guo. All rights reserved.
//

#import "TableViewController.h"
#import "SQLiteManager.h"
#import "User.h"

@interface TableViewController ()

@end

@implementation TableViewController
//@synthesize items ;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SQLiteManager *mgr = [SQLiteManager alloc] ;
    self.items = [mgr listUsers] ;
//    items = [NSArray arrayWithObjects:@"item1", @"item2" , nil] ;
    
    self.textView.text = @"Hello World" ;
    self.table.dataSource = self ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"cellId" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId] ;
    
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] ;
    User* user = [self.items objectAtIndex:indexPath.row] ;
    cell.textLabel.text = user.username ;
    
    return cell ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count] ;
}
@end
