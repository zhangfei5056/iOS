//
//  ViewController.m
//  testAnything
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1tap:(id)sender {
//    [self performSegueWithIdentifier:@"button1" sender:sender];
//    DetailViewController *vc = [[DetailViewController alloc] initWithData:@"sdfsdfsdf"];
    DetailViewController *vc = [[DetailViewController alloc] initWithBlock:^(NSString *msg){
        self.text.text = msg;
        NSLog(@"\n\n\nmsg = %@",msg);
    }];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
