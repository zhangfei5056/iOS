//
//  ViewController.m
//  testTransSegue
//
//  Created by caoyuan on 7/13/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            
- (IBAction)btaction:(id)sender;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    [self performSegueWithIdentifier:@"good" sender:sender];
}
- (IBAction)btaction:(id)sender {
}
- (IBAction)dsfs:(id)sender {
}
@end
