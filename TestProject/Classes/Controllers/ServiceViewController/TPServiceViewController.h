//
//  TPServiceViewController.h
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//



#import "TPBaseViewController.h"

@class ODRefreshControl;

@interface TPServiceViewController : TPBaseViewController <UITableViewDataSource, UITableViewDelegate> {

}

@property(nonatomic, retain) IBOutlet UITableView *tableView;


@end
