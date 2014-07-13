//
//  TempRootViewController.m
//  tabelView
//
//  Created by caoyuan on 7/10/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "TempRootViewController.h"
#import "GroupBean.h"
#import "ContactBean.h"
#import "ListRowCell.h"
#import "UserInfo.h"
#import "UserInfoViewController.h"
@interface TempRootViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contacts;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TempRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        contacts = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

//    NSString *urlStr = @"http://192.168.254.68:19750/publicApi/index.php/Contact/agencyUserList/";
    NSString *urlStr = @"http://221.226.102.18:19750/publicApi/index.php/Contact/agencyUserList/";
    NSMutableDictionary *resDic = [self requestWithURLStringReturnMutableDic:urlStr];
    NSMutableArray *agencyGroupLsit = [[resDic objectForKey:@"detail"] objectForKey:@"agencyGroupList"];
//    NSLog(@"\n\n\n\n%@",agencyGroupLsit);
    [self parseJSONArray:agencyGroupLsit];

//    ContactBean *cb = (ContactBean*) [contacts objectAtIndex:0];
//    NSLog(@"\n\n\n\n%@",cb.name);
//    for (id jsonDic in contacts) {
//        cb = (ContactBean*)jsonDic;
//        NSLog(@"%@ %@",cb.name,cb.phone);
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - data
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contacts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListRowCell";
    ListRowCell *cell = (ListRowCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        //        cell = [[ListRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [[ListRowCell alloc] initFromNibWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ContactBean *cb = (ContactBean*) [contacts objectAtIndex:indexPath.row];
    //        NSLog(@"%@ %@",cb.name,cb.phone);

//    cell.textLabel.text = [NSString stringWithFormat:@"%@:%@",cb.name, cb.phone];
    cell.titleLabel.text = cb.name;
    cell.phoneLabel.text = cb.phone;
    NSString *photoUrl = cb.user_photo;
    [cell updateUserIcon:photoUrl];

    return cell;

}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//
    ContactBean *cb = (ContactBean*) [contacts objectAtIndex:indexPath.row];
//
//        NSArray *list = [dic objectForKey:@"groupDetail"];
//        int index = indexPath.row - 1;
//        UserInfo *info = [UserInfo parserUserInfo:[list objectAtIndex:index]];
    UserInfo *info = [UserInfo parserUserInfoFromContactBean:cb];

UserInfoViewController *userVC = [[UserInfoViewController alloc] initWithNibName:@"UserInfoViewController" bundle:nil];
            userVC.userInfo = info;
[self.navigationController pushViewController:userVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - priveta
-(void)getAddressList{
    NSString *urlStr = @"http://192.168.254.68:19750/publicApi/index.php/Contact/agencyUserList/";
    NSMutableDictionary *resDic = [self requestWithURLStringReturnMutableDic:urlStr];
    NSMutableArray *agencyGroupLsit = [[resDic objectForKey:@"detail"] objectForKey:@"agencyGroupList"];
    //    NSLog(@"\n\n\n\n%@",agencyGroupLsit);
    [self parseJSONArray:agencyGroupLsit];
    NSLog(@"\n\n\n%d",[contacts count]);
}

-(NSMutableDictionary*)requestWithURLStringReturnMutableDic:(NSString*)urlStr {

	NSURL *url = [NSURL URLWithString:urlStr];
	NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //  [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	//  [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *resStr = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
	NSData *strData = [resStr dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
	NSMutableDictionary *mutableDic = (NSMutableDictionary*)[NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingMutableLeaves error:nil];
	return mutableDic;
}

-(NSMutableArray*)parseJSONArray:(NSMutableArray*)agencyGroupList{
    NSMutableArray *groups = [[NSMutableArray alloc]initWithCapacity:1];
    for (NSDictionary* jsonObject in agencyGroupList) {
        GroupBean *groupBean = [[GroupBean alloc] init];
        groupBean.deptName = [jsonObject objectForKey:@"deptName"];
        groupBean.deptId = [jsonObject objectForKey:@"deptId"];
        groupBean.deptListTotal = [jsonObject objectForKey:@"deptListTotal"];
        NSArray *contactArray = nil;
        contactArray = [jsonObject objectForKey:@"deptDetail"];
        if (contactArray != nil && [contactArray count] > 0) {
            for (NSDictionary *contactJsonObject in contactArray) {
                ContactBean *contactBean = [[ContactBean alloc] init];
                contactBean.userId = [contactJsonObject objectForKey:@"userId"];
                contactBean.name = [contactJsonObject objectForKey:@"name"];
                contactBean.sex = [contactJsonObject objectForKey:@"sex"];
                contactBean.phone = [contactJsonObject objectForKey:@"phone"];
                contactBean.tel = [contactJsonObject objectForKey:@"tel"];
                contactBean.fex = [contactJsonObject objectForKey:@"fex"];
                contactBean.exttex = [contactJsonObject objectForKey:@"exttex"];
                contactBean.email = [contactJsonObject objectForKey:@"email"];
                contactBean.birthday = [contactJsonObject objectForKey:@"brithday"];
                contactBean.administration = [contactJsonObject objectForKey:@"administration"];
                contactBean.department = [contactJsonObject objectForKey:@"department"];
                contactBean.oldUnit = [contactJsonObject objectForKey:@"oldUnit"];
                contactBean.user_photo = [contactJsonObject objectForKey:@"user_photo"];
                [contacts addObject:contactBean];
            }
            groupBean.deptDetail = contacts;
        }
        else {
            groupBean.deptDetail = nil;
        }

        @try {
            NSMutableArray *childArray = [jsonObject objectForKey:@"child"];
            if (nil != childArray && [childArray count] > 0) {
                groupBean.child = [self parseJSONArray:childArray];
            }
            else {
                groupBean.child = nil;
            }
        }
        @catch (NSException *exception) {
            groupBean.child = nil;
        }
        [groups addObject:groupBean];
    }
    return groups;
}



@end
