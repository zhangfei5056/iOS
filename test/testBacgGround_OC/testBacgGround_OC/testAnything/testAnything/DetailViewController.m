//
//  DetailViewController.m
//  testAnything
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property(strong ,nonatomic) NSString *data;
@end

@implementation DetailViewController
-(id)initWithBlock:(void(^)(NSString* msg))block {
    self = [super init];
    if (self) {
        block = ^(NSString *msg){
            msg = @"sdfsdfsdf";
        };
    }
    return self;
}

-(id)initWithData:(NSString*) dataTrans{
    self = [super init];
    if (self) {
        self.data = dataTrans;
    }
    return self;
}

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
    // Do any additional setup after loading the view from its nib.
    self.text.text = self.data;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)but:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
