//
//  TPEmployeeDetailsViewController.m
//  TestProject
//
//  Created by Zhenia on 11/1/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPEmployeeDetailsViewController.h"
#import "TPAccountant.h"
#import "TPDirector.h"
#import "TPTime.h"
#import "TPCoreDataManager.h"

@interface TPEmployeeDetailsViewController ()

@property(nonatomic, retain) id model;

@end

@implementation TPEmployeeDetailsViewController {
    TPEmployeeType _selectedEmployeeType;
}
@synthesize model = _model;

- (void)dealloc {
    [_model release], _model = nil;
    [super dealloc];
}


#pragma mark - Dealloc and Initialization

- (id)initWithModel:(id)aModel {
    self = [super initWithNibName:@"TPEmployeeDetailsViewController" bundle:nil];
    if (self) {
        self.model = aModel;       
    }
    return self;
}

#pragma mark - View management

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Add Employee", @"Add Employee");
    if (self.model) {
        self.title = NSLocalizedString(@"Edit Employee", @"Edit Employee");
        [self fillViews];
    }
    [self updateViews];

    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"Save")
                                                                          style:UIBarButtonItemStyleDone
                                                                         target:self
                                                                         action:@selector(saveTapped:)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
    [saveBarButtonItem release];

    UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Cancel", @"Cancel")
                                                                            style:UIBarButtonItemStyleBordered
                                                                           target:self
                                                                           action:@selector(cancelTapped:)];
    self.navigationItem.leftBarButtonItem = cancelBarButtonItem;
    [cancelBarButtonItem release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViews {
    [_availableTimeTextField setHidden:YES];
    [_accountantTypeControl setHidden:YES];
    [_dinnerTimeTextField setHidden:YES];
    [_workplaceNumberTextField setHidden:YES];
    switch (_selectedEmployeeType) {
        case TPEmployeeTypeRegular: {
            [_dinnerTimeTextField setHidden:NO];
            [_workplaceNumberTextField setHidden:NO];
        }
            break;
        case TPEmployeeTypeAccountant: {
            [_accountantTypeControl setHidden:NO];
            [_dinnerTimeTextField setHidden:NO];
            [_workplaceNumberTextField setHidden:NO];
        }
            break;
        case TPEmployeeTypeDirector: {
            [_availableTimeTextField setHidden:NO];
        }
            break;
    }
}

- (void)fillViews {

    TPBaseEmployeeModel *model = self.model;
    _nameTextField.text = model.name;
    _salaryTextField.text = [model.salary stringValue];
    if ([self.model isKindOfClass:[TPDirector class]]) {
        _selectedEmployeeType = TPEmployeeTypeDirector;
        [_employeeTypeControl setSelectedSegmentIndex:TPEmployeeTypeDirector];
        TPTime *availableTime = [(TPDirector *)self.model availableTime];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:MM"];
        _availableTimeTextField.text = [NSString stringWithFormat:@"%@ - %@",
                        [formatter stringFromDate:availableTime.startTime],
                        [formatter stringFromDate:availableTime.endTime]];
        [formatter release];
    }
    else {
        TPTime *dinnerTime = [(TPEmployee *)self.model dinnerTime];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:MM"];
        _dinnerTimeTextField.text = [NSString stringWithFormat:@"%@ - %@",
                                                                  [formatter stringFromDate:dinnerTime.startTime],
                                                                  [formatter stringFromDate:dinnerTime.endTime]];
        [formatter release];

        _workplaceNumberTextField.text = [(TPEmployee *)self.model workingPlaceNumber];

        if ([self.model isKindOfClass:[TPAccountant class]]) {
            [_accountantTypeControl setSelectedSegmentIndex:[(TPAccountant *)self.model type]];
            _selectedEmployeeType = TPEmployeeTypeAccountant;
            [_employeeTypeControl setSelectedSegmentIndex:TPEmployeeTypeAccountant];
        }
        else {
            _selectedEmployeeType = TPEmployeeTypeRegular;
            [_employeeTypeControl setSelectedSegmentIndex:TPEmployeeTypeRegular];
        }
    }
}

#pragma mark - IB Actions

- (void)showTimePicker {

}

- (IBAction)employeeTypeChanged:(UISegmentedControl *)aSegmentedControl {
    _selectedEmployeeType = (TPEmployeeType) aSegmentedControl.selectedSegmentIndex;
    [self updateViews];
}

- (void)cancelTapped:(UIBarButtonItem *)aSender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)saveTapped:(UIBarButtonItem *)aSender {

    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    if (self.model != nil) {
        [context deleteObject:self.model];
    }
    TPBaseEmployeeModel *newModel = nil;

    switch (_selectedEmployeeType) {
        case TPEmployeeTypeRegular: {
            newModel = [TPEmployee createEmployeeWithName:_nameTextField.text];
        }
            break;
        case TPEmployeeTypeAccountant: {
            newModel = [TPAccountant createEmployeeWithName:_nameTextField.text];
            ((TPAccountant *)newModel).type = (TPAccountantType) _accountantTypeControl.selectedSegmentIndex;
        }
            break;
        case TPEmployeeTypeDirector: {
            newModel = [TPDirector createEmployeeWithName:_nameTextField.text];

        }
            break;
    }
    newModel.salary = [NSNumber numberWithInteger:[_salaryTextField.text integerValue]];

    [[TPCoreDataManager sharedInstance] saveContext];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([textField isEqual:_dinnerTimeTextField] || [textField isEqual:_availableTimeTextField]) {
        [self showTimePicker];
        return NO;
    }

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


@end
