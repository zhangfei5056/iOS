//
//  SearchViewController.h
//  SBRequest_iPad
//
//  Created by caoyuan on 7/15/14.
//  Copyright (c) 2014 caoyuan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (strong, nonatomic) NSString* token;
@property (strong, nonatomic) NSString* word;
@property (strong, nonatomic) NSString* idd;
@property (strong, nonatomic) NSString* cn_definition;

@property (weak, nonatomic) IBOutlet UIButton *searchBT;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *statusBT;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)addNewWord:(id)sender;
- (IBAction)search:(id)sender;
- (IBAction)statusBTAction:(id)sender;

@end
