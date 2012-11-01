//
//  TPListViewController.h
//  TestProject
//
//  Created by Zhenia on 10/31/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//


#import "TPBaseViewController.h"

@interface TPListViewController : TPBaseViewController <UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *_tableView;
}

@end
