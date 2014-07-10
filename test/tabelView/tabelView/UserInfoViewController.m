//
//  UserInfoViewController.m
//  AddressList
//
//  Created by mini on 13-3-15.
//  Copyright (c) 2013年 mini. All rights reserved.
//

#import "UserInfoViewController.h"
#import <MessageUI/MessageUI.h>
#import <AddressBook/AddressBook.h>
#import "UserInfo.h"
#import <QuartzCore/QuartzCore.h>

@interface UserInfoViewController ()<MFMailComposeViewControllerDelegate,
                                    MFMessageComposeViewControllerDelegate>{
    UIWebView *_phoneCallWebView;
    UserInfo *_userInfo;
}

@property(nonatomic, retain)IBOutlet UIImageView *iconView;
@property(nonatomic, retain)IBOutlet UILabel *nameLabel;
@property(nonatomic, retain)IBOutlet UILabel *sexLabel;
@property(nonatomic, retain)IBOutlet UILabel *birthdayLabel;
@property(nonatomic, retain)IBOutlet UILabel *departLabel;
@property(nonatomic, retain)IBOutlet UILabel *phoneLabel;
@property(nonatomic, retain)IBOutlet UILabel *telLabel;
@property(nonatomic, retain)IBOutlet UILabel *emailLabel;
@property(nonatomic, retain)IBOutlet UILabel *fexLabel;

-(IBAction)callPhone:(id)sender;
-(IBAction)sendMsg:(id)sender;
-(IBAction)sendMail:(id)sender;
-(IBAction)addToAddress:(id)sender;

@end

@implementation UserInfoViewController

@synthesize userInfo = _userInfo;
@synthesize iconView,nameLabel,sexLabel,birthdayLabel,departLabel,phoneLabel,telLabel,emailLabel,fexLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [iconView release]; iconView = nil;
    [nameLabel release]; nameLabel = nil;
    [sexLabel release]; sexLabel = nil;
    [birthdayLabel release]; birthdayLabel = nil;
    [departLabel release]; departLabel = nil;
    [phoneLabel release]; phoneLabel = nil;
    [telLabel release]; telLabel = nil;
    [emailLabel release]; emailLabel = nil;
    [fexLabel release]; fexLabel = nil;
    [_phoneCallWebView release]; _phoneCallWebView = nil;
    
    [_userInfo release]; _userInfo = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *backBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBt setFrame:CGRectMake(0, 0, 50, 32)];
    [backBt addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    [backBt setImage:[UIImage imageNamed:@"back_bt@2x.png"] forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:backBt] autorelease];
    self.title = _userInfo.name;
    
    [[self.iconView layer] setMasksToBounds:YES];
    [[self.iconView layer] setCornerRadius:3.0];
    
    self.iconView.image = [UIImage imageNamed:@"user_icon"];
    [self performSelectorInBackground:@selector(updateUserIcon) withObject:nil];
    self.nameLabel.text = _userInfo.name;
    self.sexLabel.text = _userInfo.sex;
    self.birthdayLabel.text = _userInfo.brithday;
    self.departLabel.text = _userInfo.department;
    self.phoneLabel.text = _userInfo.phone;
    self.telLabel.text = _userInfo.tel;
    self.emailLabel.text = _userInfo.email;
    self.fexLabel.text = _userInfo.fex;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)updateUserIcon{
    if (![self.userInfo.user_photo isEqualToString:@"未知"]) {
        NSURL *url = [NSURL URLWithString:self.userInfo.user_photo];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        if (!image) {
            image = [UIImage imageNamed:@"user_icon"];
        }
        self.iconView.image = image;
    }
}

- (void) alertWithTitle: (NSString *)title msg: (NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

-(IBAction)addToAddress:(id)sender
{
    //name
    ABAddressBookRef addressBook = NULL;
    __block BOOL accessGranted = NO;
    
    if (ABAddressBookRequestAccessWithCompletion != NULL) { // we're on iOS 6
        addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        //等待同意后向下执行
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        dispatch_release(sema);
    }
    else { // we're on iOS 5 or older
        accessGranted = YES;
        addressBook = ABAddressBookCreate();
    }
    
    if (accessGranted) {
        // Do whatever you want here.
        ABRecordRef newPerson = ABPersonCreate();
        CFErrorRef error = NULL;
        ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (CFStringRef)_userInfo.name, &error);
        // 设置birthday属性
        if ([_userInfo.brithday length] > 0) {
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"yyyy-mm-dd"];
            NSDate *birthday = [format dateFromString:_userInfo.brithday];
            [format release];
            ABRecordSetValue(newPerson, kABPersonBirthdayProperty, (CFDateRef)birthday, NULL);
        }
        //phone number
        ABMutableMultiValueRef multiPhone = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(multiPhone, _userInfo.fex, (CFStringRef)@"传真", NULL);
        ABMultiValueAddValueAndLabel(multiPhone, (CFStringRef)[NSString stringWithFormat:@"%@-%@",_userInfo.tel,_userInfo.exttex], (CFStringRef)@"住宅", NULL);
        ABMultiValueAddValueAndLabel(multiPhone, _userInfo.phone, (CFStringRef)@"手机", NULL);
        ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone, &error);
        CFRelease(multiPhone);
        //email
        ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(multiEmail,_userInfo.email, kABWorkLabel, NULL);
        ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail, &error);
        CFRelease(multiEmail);
        //picture
        NSData *dataRef = UIImagePNGRepresentation(self.iconView.image);
        ABPersonSetImageData(newPerson, (CFDataRef)dataRef, &error);
        ABAddressBookAddRecord(addressBook, newPerson, &error);
        ABAddressBookSave(addressBook, &error);
        CFRelease(newPerson);
        
        [self alertWithTitle:nil msg:@"已添加通讯录"];
    }
    
}

-(IBAction)callPhone:(id)sender
{
    int tag = [sender tag];
    NSString *numStr = (tag == 0) ? _userInfo.phone:_userInfo.tel;
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",numStr]];
    if ( !_phoneCallWebView )
    {
        _phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    [_phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];     
}

-(IBAction)sendMsg:(id)sender
{
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    if (messageClass != nil) {
        if ([messageClass canSendText]) {
            MFMessageComposeViewController*picker = [[MFMessageComposeViewController alloc] init];
            picker.recipients = [NSArray arrayWithObject:_userInfo.phone];
            picker.messageComposeDelegate= self;
            picker.body = @""; // 默认信息内容
            
            [self presentModalViewController:picker animated:YES];
            [picker release];
        } else {
            [self alertWithTitle:nil msg:@"设备没有短信功能"];
        }
    } else {
        [self alertWithTitle:nil msg:@"iOS版本过低，iOS4.0以上才支持程序内发送短信"];
    }
}

-(IBAction)sendMail:(id)sender
{
    if ([_userInfo.email isEqualToString:@"未知"]) {
        return;
    }
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}

//可以发送邮件的话
-(void)displayComposerSheet
{
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    
    //设置主题
    [mailPicker setSubject: @""];
    
    // 添加发送者
    NSArray *toRecipients = [NSArray arrayWithObject: _userInfo.email];
    [mailPicker setToRecipients: toRecipients];
    
    NSString *emailBody =@"";
    [mailPicker setMessageBody:emailBody isHTML:YES];
    
    [self presentModalViewController: mailPicker animated:YES];
    [mailPicker release];
}

-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:first@example.com&subject=my email!";
    NSString *body = @"&body=email body!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:email]];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSString *msg = nil;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg = @"邮件发送取消";
            break;
        case MFMailComposeResultSaved:
            msg = @"邮件保存成功";
            break;
        case MFMailComposeResultSent:
            msg = @"邮件发送成功";
            break;
        case MFMailComposeResultFailed:
            msg = @"邮件发送失败";
            break;
        default:
            break;
    }
    [self alertWithTitle:nil msg:msg];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    NSString*msg;
    
    switch (result) {
        case MessageComposeResultCancelled:
            msg = @"短信发送取消";
            break;
        case MessageComposeResultSent:
            msg = @"短信发送成功";
            [self alertWithTitle:nil msg:msg];
            break;
        case MessageComposeResultFailed:
            msg = @"短信发送失败";
            [self alertWithTitle:nil msg:msg];
            break;
        default:
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

@end
