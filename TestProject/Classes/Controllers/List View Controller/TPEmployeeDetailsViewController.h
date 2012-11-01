//
//  TPEmployeeDetailsViewController.h
//  TestProject
//
//  Created by Zhenia on 11/1/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPBaseViewController.h"

@class TPKeyboardAvoidingScrollView;

@interface TPEmployeeDetailsViewController : TPBaseViewController <UITextFieldDelegate>
{
    IBOutlet TPKeyboardAvoidingScrollView *_scrollView;

    IBOutlet UISegmentedControl *_employeeTypeControl;
    IBOutlet UITextField *_nameTextField;
    IBOutlet UITextField *_salaryTextField;
    IBOutlet UITextField *_availableTimeTextField;
    IBOutlet UITextField *_workplaceNumberTextField;
    IBOutlet UITextField *_dinnerTimeTextField;
    IBOutlet UISegmentedControl *_accountantTypeControl;
}

- (id)initWithModel:(id)aModel;


@end
