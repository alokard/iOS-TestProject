//
//  TPServiceViewController.m
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPServiceViewController.h"

@interface TPServiceViewController ()

@end

@implementation TPServiceViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
