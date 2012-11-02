//
//  TPAlertHelper.h
//  TestProject
//
//  Created by Zhenia Tulusha on 08.06.12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

@interface TPAlertHelper : NSObject

+ (void)showActivityIndicator;
+ (void)showSuccessAlertWithText:(NSString *)message;
+ (void)showErrorAlertWithText:(NSString *)message;

+ (void)dismiss;

@end
