//
//  TabelViewController.h
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "BaseViewController.h"

@interface TableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataAry;
@property (strong,nonatomic)NSString* updateType;
@property (strong, nonatomic) NSString* name;
@end
