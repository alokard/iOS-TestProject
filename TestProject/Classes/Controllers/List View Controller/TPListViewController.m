//
//  TPListViewController.m
//  TestProject
//
//  Created by Zhenia on 10/31/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPListViewController.h"

@interface TPListViewController ()

@end

@implementation TPListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"List", @"List");
        self.tabBarItem.image = [UIImage imageNamed:@"ListTabBarIcon.png"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
