//
//  BaseViewController.m
//  QingAoActivity
//
//  Created by mini on 13-4-12.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    [self resetNavigationBarBackground];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_view.jpg"]]];
}

- (void)resetBackgroundColor:(UIColor *)color
{
    [self.view setBackgroundColor:color];
}

- (void)addCustomBackBarItem
{
    UIButton *backBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBt setImage:[UIImage imageNamed:@"back_navBar.png"] forState:UIControlStateNormal];
    [backBt setFrame:CGRectMake(0, 0, 60, 44)];
    [backBt addTarget:self action:@selector(popSelfViewControler) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBt] ;
    [self.navigationItem setLeftBarButtonItem:backBarItem];
    [backBarItem release];
}

- (void)popSelfViewControler
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissSelfViewControler
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)resetNavigationBarBackground{
    UIImage *image = [UIImage imageNamed:@"bg_navigationBar"];
    Class ios5Class = (NSClassFromString(@"CIImage"));
    if (nil != ios5Class) {
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:0];
        [self.navigationController.toolbar setBackgroundImage:image
                                           forToolbarPosition:UIToolbarPositionBottom
                                                   barMetrics:0];
    }else{
        self.navigationController.navigationBar.layer.contents = (id)image.CGImage;
        self.navigationController.toolbar.layer.contents = (id)image.CGImage;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
