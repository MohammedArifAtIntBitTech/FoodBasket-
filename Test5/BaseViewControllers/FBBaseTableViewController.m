//
//  BaseFBTableViewController.m
//  Test5
//
//  Created by MacMini1 on 11/5/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FBBaseTableViewController.h"
#import "DataManager.h"

@interface FBBaseTableViewController ()

@end

@implementation FBBaseTableViewController

#pragma mark -LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - DataSource

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    return cell;
}

@end
