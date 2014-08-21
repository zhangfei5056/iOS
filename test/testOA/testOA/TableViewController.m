//
//  TabelViewController.m
//  testOA
//
//  Created by caoyuan on 8/19/14.
//  Copyright (c) 2014 cniia. All rights reserved.
//

#import "TableViewController.h"
#import "ChangeViewController.h"
 NSString *const MJTableViewCellIdentifier = @"Cell";
@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.tableView.dataSource  = self;
    self.tableView.delegate = self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    if ([self.updateType isEqualToString:@"updateAttenDuty"]) {
        self.title = @"check in";
    }else if([self.updateType isEqualToString:@"updateDiary"]){
         self.title = @"diray";
    }
    else {
         self.title = @"nothing";;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MJTableViewCellIdentifier];
    if (!cell) {
        cell   = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MJTableViewCellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
        cell.textLabel.numberOfLines = 4;
    }

    cell.textLabel.text = self.dataAry[indexPath.row];
//    cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.775 blue:0.747 alpha:1.000];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChangeViewController *vc = [[ChangeViewController alloc]init];
    vc.cmd = self.updateType;

    NSLog(@"%@",self.dataAry[indexPath.row]);

    if ([self.updateType isEqualToString:@"updateAttenDuty"]) {
        int loc = 5+1+[self.name length]+3;
        vc.timeStr = [self.dataAry[indexPath.row] substringWithRange:NSMakeRange(loc, 20)];
        vc.id = [self.dataAry[indexPath.row] substringWithRange:NSMakeRange(1, 5)];
        NSLog(@"%@",vc.timeStr);
         NSLog(@"%@",vc.id);
    }else if([self.updateType isEqualToString:@"updateDiary"]){
        int loc2 = 1+5+1+[self.name length]+1+19+1;
        NSLog(@"loc2:%d",[self.name length]);
        NSLog(@"%d",[self.dataAry[indexPath.row] length]);
        vc.timeStr = [self.dataAry[indexPath.row] substringWithRange:NSMakeRange(loc2, 19)];
        vc.id = [self.dataAry[indexPath.row] substringWithRange:NSMakeRange(1, 5)];
        NSLog(@"%@",vc.timeStr);
         NSLog(@"%@",vc.id);
    }
    else {return;}

    [self.navigationController pushViewController:vc animated:YES];


}

@end
