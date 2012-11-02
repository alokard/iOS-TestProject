//
//  TPAlertHelper.m
//  TestProject
//
//  Created by Zhenia Tulusha on 08.06.12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "SVProgressHUD.h"
#import "TPAlertHelper.h"

@implementation TPAlertHelper

+ (void)showActivityIndicator {
    [SVProgressHUD show];
}

+ (void)showSuccessAlertWithText:(NSString *)message {
    [SVProgressHUD showSuccessWithStatus:message duration:3.0];
}

+ (void)showErrorAlertWithText:(NSString *)message {
    [SVProgressHUD showErrorWithStatus:message duration:5.0];
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

@end
