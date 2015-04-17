//
//  SearchViewController.m
//  SBRequest_iPad
//
//  Created by caoyuan on 7/15/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "SearchViewController.h"
#import "FuckHttp.h"
#import "AuthorizationViewController.h"
@interface SearchViewController () <UITextFieldDelegate>

@end

@implementation SearchViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    NSLog(@"\n\n%@",self.token);
    self.searchTextField.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)addNewWord:(id)sender {
    
     NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *token =  [userDefaultes stringForKey:@"token"];
    NSLog(@"userDefaultes token : %@",token);
    
    NSString *addNewWordURL = [NSString stringWithFormat:@"https://api.shanbay.com/bdc/learning/?access_token=%@",token];

    NSDictionary *postDic = @{@"id":self.idd};
    NSMutableDictionary  *ddd = [[NSMutableDictionary alloc] initWithDictionary:postDic];
    NSDictionary *dic = (NSDictionary*)[FuckHttp post:addNewWordURL postDic:ddd];
    NSLog(@"\n\n%@",dic);
    NSString* msg = (NSString*)[dic objectForKey:@"msg"];
    if ([msg isEqualToString:@"SUCCESS"]) {
        self.statusBT.titleLabel.text = @"add success";
    }else{
        self.statusBT.titleLabel.text = @"failed";
    }
}

- (IBAction)search:(id)sender {
    NSLog(@"\n\n%@",self.token);
    if (self.searchTextField.text.length == 0) {
        [self.searchTextField becomeFirstResponder];
    }else {
        NSString *mayWithSpaceWord = self.searchTextField.text;
        self.word = [self getWordWithNoSpace:mayWithSpaceWord];
        NSDictionary *dic = (NSDictionary*)[FuckHttp get:[NSString stringWithFormat:@"https://api.shanbay.com/bdc/search/?word=%@",self.word]];
        NSLog(@"\n\n%@",dic);
        self.cn_definition = (NSString*)[[[dic objectForKey:@"data"] objectForKey:@"cn_definition"] objectForKey:@"defn"];
        self.resultLabel.text = self.cn_definition;
        self.idd = [NSString stringWithFormat:@"%@",[[dic objectForKey:@"data"] objectForKey:@"conent_id"] ];
    }
}

- (IBAction)statusBTAction:(id)sender {
    self.statusBT.titleLabel.text = @"status:";
    self.searchTextField.text = @"";
}

-(NSString*)getWordWithNoSpace:(NSString*) wordStr {
    NSString *word = wordStr;
    if (word) {
        while ([word hasSuffix:@" "]) {
            word = [word substringToIndex:([word length]-1)];
        }
    }
    return word;
}

#pragma mark - textfield delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTextField resignFirstResponder];
    [self search:[self getWordWithNoSpace:self.searchTextField.text]];
    return YES;
}
@end
