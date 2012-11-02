//
//  TPServiceViewController.m
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPServiceViewController.h"
#import "ODRefreshControl.h"
#import "TPServiceItem.h"
#import "TPServiceItemTableViewCell.h"
#import "TPAlertHelper.h"
#import "Reachability.h"

@interface TPServiceViewController ()

@property(nonatomic, strong) ODRefreshControl *refreshControl;
@property(nonatomic, retain) NSArray *items;

@end

@implementation TPServiceViewController {
@private
    ODRefreshControl *_refreshControl;
}

@synthesize refreshControl = _refreshControl;
@synthesize items = _items;
@synthesize tableView = _tableView;


- (void)dealloc {
    self.refreshControl= nil;
    [_items release], _items = nil;
    [_tableView release], _tableView = nil;
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Service", @"Service");
        self.tabBarItem.image = [UIImage imageNamed:@"ServiceTabBarIcon.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:_tableView];
    refreshControl.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = [refreshControl autorelease];

    _tableView.allowsSelection = NO;
    [self reloadNetworkData];
}

- (void)viewDidUnload {
    self.refreshControl= nil;
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Loading methods

- (void)reloadNetworkData {
    if (![[Reachability reachabilityForInternetConnection] isReachable]) {
        [TPAlertHelper showErrorAlertWithText:NSLocalizedString(@"Sorry, You don't have internet connection. Try again later", @"Sorry, You don't have internet connection. Try again later")];
        [self doneLoadingTableViewData];
    }
    else {
        __block TPServiceViewController *weakSelf = self;
        if (![self.refreshControl refreshing]) {
            [TPAlertHelper showActivityIndicator];
        }
        [TPServiceItem loadServiceItemsWithBlock:^(NSArray *items, NSError *error) {
            [TPAlertHelper dismiss];

            weakSelf.items = items;
            [weakSelf.tableView reloadData];
            [weakSelf doneLoadingTableViewData];
        }];
    }
}

#pragma mark - ODRefreshControl Methods

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    [self reloadNetworkData];
}

- (void)doneLoadingTableViewData{

    //  model should call this when its done loading
    [_refreshControl endRefreshing];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TPServiceItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TPServiceItemTableViewCell" owner:self options:nil] lastObject];
    }

    TPServiceItem *model = [self.items objectAtIndex:indexPath.row];
    cell.dateLabel.text = model.date;

    CGRect frame = cell.itemTextLabel.frame;
    frame.size.height = [model textHeightForWidth:(tableView.frame.size.width - 20)];
    cell.itemTextLabel.frame = frame;
    cell.itemTextLabel.text = model.text;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TPServiceItem *model = [self.items objectAtIndex:indexPath.row];
    return [model textHeightForWidth:(tableView.frame.size.width - 20)] + 40;
}


#pragma mark - Table View Delegate

@end
