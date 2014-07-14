//
//  AuthorizationViewController.h
//  SBRequest
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ARCSingletonTemplate.h"
@interface AuthorizationViewController : UIViewController
//SYNTHESIZE_SINGLETON_FOR_HEADER(AuthorizationViewController)

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)getTheToken:(id)sender;
- (IBAction)reLogin:(id)sender;




@property (strong, nonatomic) NSString* token;
@property (strong, nonatomic) NSString* cnWord;
@property (strong, nonatomic) NSString* enWord;
@property (strong, nonatomic) NSString* idd;


@end



