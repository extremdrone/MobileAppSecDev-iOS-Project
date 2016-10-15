//
//  ViewControllerCacheName.m
//  MobileSecureCode
//
//  Created by Rex on 2016/7/22.
//  Copyright © 2016年 Rex. All rights reserved.
//

#import "ViewControllerCacheName.h"
#import "CommonFunc.h"
#import "AppDelegate.h"
#import "ChristmasConstants.h"
#import "KeychainWrapper.h"

@interface ViewControllerCacheName ()

@end

@implementation ViewControllerCacheName

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) AppendLog:(NSString*) msg
{
    NSLog(@"%@", msg);
    dispatch_async(dispatch_get_main_queue(), ^{
        /* Do UI work here */
        NSString *txt = self.logs.text;
        [self.logs setText:[[txt stringByAppendingString:@"\n"] stringByAppendingString:msg]];
    });
}

- (IBAction) btnCloseClicked:(id)sender
{
    [self dismissViewControllerAnimated:FALSE completion:NULL];
}

- (IBAction) btnClearClicked:(id)sender
{
    [self.logs setText:@""];
}

- (IBAction) btnActionClicked:(id)sender
{
    NSUInteger fieldHash = [self.edit_input.text hash];
    NSString *fieldString = [KeychainWrapper securedSHA256DigestHashForPIN:fieldHash];
    [self AppendLog:[NSString stringWithFormat:@"Hash=%@", fieldString]];
    [self AppendLog:[NSString stringWithFormat:@"UDID=%@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]]];
}


@end
