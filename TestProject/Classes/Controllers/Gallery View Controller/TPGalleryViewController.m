//
//  TPGalleryViewController.m
//  TestProject
//
//  Created by Zhenia on 10/31/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPGalleryViewController.h"

static NSInteger const kImageQuantity = 16;

@interface TPGalleryViewController ()

@property(nonatomic, retain) NSMutableArray *photos;
@property(nonatomic, retain) TPBasePhotoBrowserController *photoBrowser;

@end

@implementation TPGalleryViewController {

}
@synthesize photos = _photos;
@synthesize photoBrowser = _photoBrowser;


- (void)dealloc {
    self.photos = nil;

    self.photoBrowser = nil;
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Gallery", @"Gallery");
        self.tabBarItem.image = [UIImage imageNamed:@"GalleryTabBarIcon.png"];
        self.photos = [NSMutableArray array];
        [self setupPhotos];
    }
    return self;
}

- (void)setupPhotos {
    for (int i = 1; i < kImageQuantity; i++) {
        MWPhoto *photo = [MWPhoto photoWithFilePath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", i]
                                                                                    ofType:@"JPG"]];
        [self.photos addObject:photo];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Left", @"Left")
                                                                          style:UIBarButtonItemStyleBordered
                                                                         target:self
                                                                         action:@selector(leftTapped:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    [leftBarButtonItem release];

    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Right", @"Right")
                                                                           style:UIBarButtonItemStyleBordered
                                                                          target:self
                                                                          action:@selector(rightTapped:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [rightBarButtonItem release];

    self.photoBrowser = [[[TPBasePhotoBrowserController alloc] initWithDelegate:self] autorelease];

    [self.view addSubview:_photoBrowser.view];
}

- (void)viewDidUnload {
    self.photoBrowser = nil;

    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)leftTapped:(id)aSender {
    [self.photoBrowser showPreviousPage];
}

- (void)rightTapped:(id)aSender {
    [self.photoBrowser showNextPage];
}

#pragma mark - Photo Browser Delegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(TPBasePhotoBrowserController *)photoBrowser {
    return self.photos.count;
}

- (MWPhoto *)photoBrowser:(TPBasePhotoBrowserController *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.photos.count)
        return [self.photos objectAtIndex:index];
    return nil;
}

- (void)currentPageUpdatedInPhotoBrowser:(TPBasePhotoBrowserController *)photoBrowser {
    NSInteger currentPageIndex = [photoBrowser currentPageIndex];
    NSInteger photosCount = self.photos.count;

    if (currentPageIndex > 0) {
        self.navigationItem.leftBarButtonItem.enabled = YES;
    }
    else{
        self.navigationItem.leftBarButtonItem.enabled = NO;
    }

    if (currentPageIndex < (photosCount - 1)) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
    else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

@end
