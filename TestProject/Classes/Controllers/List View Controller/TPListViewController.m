//
//  TPListViewController.m
//  TestProject
//
//  Created by Zhenia on 10/31/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPListViewController.h"
#import "TPEmployeeDetailsViewController.h"
#import "Models.h"
#import "TPCoreDataManager.h"

@interface TPListViewController ()

@property (nonatomic, strong) NSArray *employeesArrays;

@end

@implementation TPListViewController {
    BOOL _editing;
}

- (void)dealloc {
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"List", @"List");
        self.tabBarItem.image = [UIImage imageNamed:@"ListTabBarIcon.png"];
    }
    return self;
}

#pragma mark - View management

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEmployeeTapped:)];
    self.navigationItem.rightBarButtonItem = addBarButtonItem;
    [addBarButtonItem release];

    UIBarButtonItem *editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Edit", @"Edit") style:UIBarButtonItemStyleBordered target:self action:@selector(editTapped:)];
    self.navigationItem.leftBarButtonItem = editBarButtonItem;
    [editBarButtonItem release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self reloadTableView];
}

- (void)reloadTableView {
    self.employeesArrays = [NSArray arrayWithObjects:[TPEmployee allObjects], [TPAccountant allObjects], [TPDirector allObjects], nil];
    [_tableView reloadData];
}

#pragma mark - IB actions

- (void)editTapped:(UIBarButtonItem *)aSender {
    _editing = !_editing;

    _tableView.editing = _editing;
    NSString *editButtonTitle = NSLocalizedString(@"Edit", @"Edit");
    if (_editing) {
        editButtonTitle = NSLocalizedString(@"Done", @"Done");
    }
    aSender.title = editButtonTitle;
}

- (void)addEmployeeTapped:(id)aSender {
    TPEmployeeDetailsViewController *controller = [[TPEmployeeDetailsViewController alloc] initWithNibName:@"TPEmployeeDetailsViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.navigationController presentModalViewController:navigationController animated:YES];
    [controller release];
    [navigationController release];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.employeesArrays count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.employeesArrays objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerTitle = nil;
    TPEmployeeType type = (TPEmployeeType) section;
    switch (type) {
        case TPEmployeeTypeRegular:
            headerTitle = @"Regular Employees";
            break;
        case TPEmployeeTypeAccountant:
            headerTitle = @"Accountants";
            break;
        case TPEmployeeTypeDirector:
            headerTitle = @"Directors";
            break;
    }
    return headerTitle;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text = ((TPBaseEmployeeModel *)[[self.employeesArrays objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]).name;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source

        TPBaseEmployeeModel *model = [[self.employeesArrays objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        [((NSMutableArray *)[self.employeesArrays objectAtIndex:indexPath.section]) removeObjectAtIndex:indexPath.row];
        [[[TPCoreDataManager sharedInstance] managedObjectContext] deleteObject:model];
        [[TPCoreDataManager sharedInstance] saveContext];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{

}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section != proposedDestinationIndexPath.section) {
        NSInteger row = 0;
        if (sourceIndexPath.section < proposedDestinationIndexPath.section) {
            row = [tableView numberOfRowsInSection:sourceIndexPath.section] - 1;
        }
        return [NSIndexPath indexPathForRow:row inSection:sourceIndexPath.section];
    }

    return proposedDestinationIndexPath;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TPBaseEmployeeModel *model = [[self.employeesArrays objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    TPEmployeeDetailsViewController *controller = [[TPEmployeeDetailsViewController alloc] initWithModel:model];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.navigationController presentModalViewController:navigationController animated:YES];
    [controller release];
    [navigationController release];
}

@end
