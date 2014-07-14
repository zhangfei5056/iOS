//
//  DetailViewController.h
//  testAnything
//
//  Created by caoyuan on 7/14/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *text;
- (IBAction)but:(id)sender;
-(id)initWithData:(NSString*) dataTrans;
-(id)initWithBlock:(void(^)(NSString* msg))fsdfsd;
@end
