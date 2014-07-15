//
//  AuthorizationViewController.m
//  SBRequest_iPad
//
//  Created by caoyuan on 7/15/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "AuthorizationViewController.h"
#import "SearchViewController.h"
#import "FuckHttp.h"
#import "AppConfig.h"
@interface AuthorizationViewController ()

@end

@implementation AuthorizationViewController
//SYNTHESIZE_SINGLETON_FOR_CLASS(AuthorizationViewController)

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
    NSString *urlStr = @"https://api.shanbay.com/oauth2/authorize/?client_id=8f1694c9eb0e0fb3009e&response_type=token&redirect_uri=https://api.shanbay.com/oauth2/auth/success/";
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];


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





- (IBAction)getTheToken:(id)sender {
    NSString* nowURLString = self.webView.request.URL.absoluteString;
    self.token = [nowURLString substringWithRange:NSMakeRange(58, 30)];
    [AppConfig sharedAppConfig].token = self.token;
    if (self.token == nil) {
        NSLog(@"token is nil");
    }
    else {
        SearchViewController *searchVC = [[SearchViewController alloc]init];
        searchVC.token = self.token;
        [self presentViewController:searchVC animated:YES completion:nil];
    }
}

- (IBAction)reLogin:(id)sender {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSHTTPCookie *cookie = nil;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    [self.webView reload];
}




@end
