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
#import "TPDateHelper.h"

#define kActionSheetTitleFrame CGRectMake(10, 7, 300, 30)
#define kActionSheetNextButtonFrame CGRectMake(260, 7, 50, 30)

static NSInteger const kActionSheetPickerTag = 100;
static NSInteger const kActionSheetTitleTag = 101;

static NSTimeInterval const kOneHour = 3600;

@interface TPEmployeeDetailsViewController ()

@property(nonatomic, retain) id model;
@property(nonatomic, retain) NSDate *fromTime;
@property(nonatomic, retain) NSDate *toTime;

@end

@implementation TPEmployeeDetailsViewController {
    TPEmployeeType _selectedEmployeeType;
    UIActionSheet *_actionSheet;

    NSDate *_fromTime;
    NSDate *_toTime;
}
@synthesize model = _model;
@synthesize fromTime = _fromTime;
@synthesize toTime = _toTime;


- (void)dealloc {
    [_actionSheet release], _actionSheet = nil;

    self.model = nil;
    self.fromTime = nil;
    self.toTime = nil;
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
        self.fromTime = availableTime.startTime;
        self.toTime = availableTime.endTime;

        _availableTimeTextField.text = [TPDateHelper stringIntervalFromTime:self.fromTime
                                                                     toTime:self.toTime];
    }
    else {
        TPTime *dinnerTime = [(TPEmployee *)self.model dinnerTime];
        self.fromTime = dinnerTime.startTime;
        self.toTime = dinnerTime.endTime;

        _dinnerTimeTextField.text = [TPDateHelper stringIntervalFromTime:self.fromTime
                                                                  toTime:self.toTime];

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

    _actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                               delegate:nil
                                      cancelButtonTitle:nil
                                 destructiveButtonTitle:nil
                                      otherButtonTitles:nil];

    [_actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];

    CGRect pickerFrame = CGRectMake(0, 40, 0, 0);

    UIDatePicker *pickerView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    [pickerView setDatePickerMode:UIDatePickerModeTime];
    pickerView.tag = kActionSheetPickerTag;
    if (self.fromTime) {
        [pickerView setDate:self.fromTime];
    }
    [_actionSheet addSubview:pickerView];
    [pickerView release];

    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = kActionSheetTitleFrame;
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.tag = kActionSheetTitleTag;
    titleLabel.text = @"From time:";
    [_actionSheet addSubview:titleLabel];
    [titleLabel release];

    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Next"]];
    closeButton.momentary = YES;
    closeButton.frame = kActionSheetNextButtonFrame;
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(nextActionSheetStep:) forControlEvents:UIControlEventValueChanged];
    [_actionSheet addSubview:closeButton];
    [closeButton release];

    [_actionSheet showInView:[[UIApplication sharedApplication] keyWindow]];
    [_actionSheet setBounds:CGRectMake(0, 0, 320, 485)];

    self.fromTime = nil;
    self.toTime = nil;
}

-(void)nextActionSheetStep:(id)sender {
    UIDatePicker *picker = (UIDatePicker *) [_actionSheet viewWithTag:kActionSheetPickerTag];

    if (self.fromTime == nil) {
        self.fromTime = [picker date];
        UILabel *titleLabel = (UILabel *) [_actionSheet viewWithTag:kActionSheetTitleTag];
        titleLabel.text = @"To time:";
        [picker setDate:[_fromTime dateByAddingTimeInterval:kOneHour] animated:YES];
    }
    else {
        self.toTime = [picker date];

        if (_selectedEmployeeType == TPEmployeeTypeDirector) {
            _availableTimeTextField.text = [TPDateHelper stringIntervalFromTime:self.fromTime
                                                                         toTime:self.toTime];
        }
        else{
            _dinnerTimeTextField.text = [TPDateHelper stringIntervalFromTime:self.fromTime
                                                                      toTime:self.toTime];
        }
        
        [_actionSheet dismissWithClickedButtonIndex:0 animated:YES];
        [_actionSheet release];
        _actionSheet = nil;
    }
}

- (IBAction)employeeTypeChanged:(UISegmentedControl *)aSegmentedControl {
    _selectedEmployeeType = (TPEmployeeType) aSegmentedControl.selectedSegmentIndex;
    [self updateViews];
}

- (void)cancelTapped:(UIBarButtonItem *)aSender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)saveTapped:(UIBarButtonItem *)aSender {

    TPBaseEmployeeModel *newModel = nil;

    switch (_selectedEmployeeType) {
        case TPEmployeeTypeRegular: {
            newModel = [TPEmployee createEmployeeWithName:_nameTextField.text];
            [(TPEmployee *) newModel setStartDinnerTime:self.fromTime];
            [(TPEmployee *) newModel setEndDinnerTime:self.toTime];
            [(TPEmployee *) newModel setWorkingPlaceNumber:_workplaceNumberTextField.text];
        }
            break;
        case TPEmployeeTypeAccountant: {
            newModel = [TPAccountant createEmployeeWithName:_nameTextField.text];
            [(TPAccountant *) newModel setStartDinnerTime:self.fromTime];
            [(TPAccountant *) newModel setEndDinnerTime:self.toTime];
            [(TPAccountant *) newModel setWorkingPlaceNumber:_workplaceNumberTextField.text];
            ((TPAccountant *) newModel).type = (TPAccountantType) _accountantTypeControl.selectedSegmentIndex;
        }
            break;
        case TPEmployeeTypeDirector: {
            newModel = [TPDirector createEmployeeWithName:_nameTextField.text];
            [(TPDirector *) newModel setStartAvailableTime:self.fromTime];
            [(TPDirector *) newModel setEndAvailableTime:self.toTime];
        }
            break;
    }
    newModel.salary = [NSNumber numberWithInteger:[_salaryTextField.text integerValue]];
    NSManagedObjectContext *context = [[TPCoreDataManager sharedInstance] managedObjectContext];
    if (self.model != nil) {
        // Save order info from old model and removing old model
        newModel.creationDate = ((TPBaseEmployeeModel *)self.model).creationDate;
        newModel.order = ((TPBaseEmployeeModel *)self.model).order;
        [context deleteObject:self.model];
    }

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
