//
//  BaseFBTableViewController.h
//  Test5
//
//  Created by MacMini1 on 11/5/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FBBaseViewController.h"

@interface FBBaseTableViewController : FBBaseViewController
@property (weak, nonatomic)IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *data;

@end
